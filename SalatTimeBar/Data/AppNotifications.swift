//
//  Notification.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 12/25/23.
//

import SwiftUI
import UserNotifications

public class AppNotifications: ObservableObject {
    public static let shared = AppNotifications()
    
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var error: String?
    
    init() {
        notificationCenter.getNotificationSettings { settings in
            DispatchQueue.main.async {
                guard (settings.authorizationStatus == .authorized) else {
                    self.error = "Permission was not granted for notifications"
                    self.addTipToUseNotificationSettings(force: true)
                    return
                }
                
                
                if settings.alertSetting != .enabled {
                    self.error = "Permission was not granted for notifications"
                    self.addTipToUseNotificationSettings(force: true)
                }
            }
        }
    }
    
    func scheduleNotifications(for salatTimes: [SalatTime]) {
        guard self.error == nil else {
            print("Notifications not scheduled because \(error ?? "")")
            return
        }
        
        resetNotifications()
        
        let upcomingTimes = salatTimes.filter { $0.time > Date() }
        
        func scheduleAllNotifications() {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            formatter.allowedUnits = [.hour, .minute]
            
            for (index, salatTime) in upcomingTimes.enumerated() {
                let content = UNMutableNotificationContent()
                content.title = salatTime.type.longDescription
                content.sound = .default
                
                // Find next salat for time calculation
                let nextSalat = index + 1 < upcomingTimes.count ? upcomingTimes[index + 1] : nil
                
                if let nextSalat = nextSalat {
                    let timeLeft = nextSalat.time.timeIntervalSince(salatTime.time)
                    
                    if nextSalat.type == .Sunrise {
                        content.body = "It's time to pray! Sunrise in \(formatter.string(from: timeLeft) ?? "")"
                    } else {
                        if salatTime.type == .Sunrise {
                            content.body = ""
                        } else {
                            content.body = "It's time to pray! "
                        }
                        content.body = content.body + "Next salat in \(formatter.string(from: timeLeft) ?? "")"
                    }
                } else {
                    // Last prayer of the sequence
                    if salatTime.type == .Sunrise {
                        content.body = ""
                    } else {
                        content.body = "It's time to pray!"
                    }
                }
                
                let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute],
                                                              from: salatTime.time)
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                
                let identifier = "prayer-\(salatTime.type.rawValue)-\(salatTime.time.timeIntervalSince1970)"
                let request = UNNotificationRequest(identifier: identifier,
                                                    content: content,
                                                    trigger: trigger)
                
                notificationCenter.add(request) { error in
                    if let error = error {
                        print("Failed to schedule \(salatTime.type.rawValue): \(error)")
                    }
                }
            }
        }
        
        if self.error != nil {
            self.requestAuth(onSuccess: scheduleAllNotifications)
        } else {
            scheduleAllNotifications()
        }
    }
    
    func requestAuth(onSuccess: (() -> Void)? = nil) {
        notificationCenter.requestAuthorization(options: [.alert]) { granted, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Handle the error here.
                    self.error = error.localizedDescription
                    self.addTipToUseNotificationSettings()
                    return
                }
                
                self.error = nil
                onSuccess?()
            }
        }
    }
    
    func resetNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    private func addTipToUseNotificationSettings(force: Bool = false) {
        guard let error = self.error, (force || ((try? error.contains(Regex("not allowed"))) ?? false) != false) else {
            return
        }
        self.error?.append(" You may need to enable notifications for this app from system notification settings")
    }
}
