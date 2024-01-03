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
    
    func scheduleNotification(for salatTime: SalatTime, nextSalat: SalatTime) {
        guard self.error == nil else {
            print("Notification not scheduled because \(error ?? "")")
            return
        }
        let content = UNMutableNotificationContent()
        let formatter = DateComponentsFormatter()
        
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        
        let timeLeft = nextSalat.time.timeIntervalSinceNow
        content.title = salatTime.type.longDescription
        if nextSalat.type == .Sunrise {
            content.body = "Sunrise in \(formatter.string(from: timeLeft) ?? "")"
        } else {
            content.body = "Next salat starts in \(formatter.string(from: timeLeft) ?? "")"
        }
        
        // Configure the recurring date.
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        let components = salatTime.time.computeDate(byAdding: .second, value: 10).get(.year, .month, .day, .hour, .minute, .second)
        dateComponents.year = components.year
        dateComponents.month = components.month
        dateComponents.day = components.day
        dateComponents.hour = components.hour
        dateComponents.minute = components.minute
        dateComponents.second = components.second
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = "\(salatTime.time.timeIntervalSince1970)|\(salatTime.type.shortDescription)"
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        
        
        func completion() {
            notificationCenter.add(request) { (error) in
                if error != nil {
                    print("Error queuing a notification \(error?.localizedDescription ?? "")")
                }
            }
        }
        if (self.error ?? "") != "" {
            completion()
        } else {
            self.requestAuth(onSuccess: completion)
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
