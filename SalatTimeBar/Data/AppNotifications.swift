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
                    return
                }
                
                
                if settings.alertSetting != .enabled {
                    self.error = "Permission was not granted for notifications"
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
        content.body = "Next prayer in \(formatter.string(from: timeLeft) ?? "")"
        
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
        
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = "\(salatTime.time.timeIntervalSince1970)|\(salatTime.type.shortDescription)"
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        
        
        self.requestAuth()
        // Schedule the request with the system.
        notificationCenter.add(request) { (error) in
            if error != nil {
                print("Error queuing a notification \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    func requestAuth() {
        notificationCenter.requestAuthorization(options: [.alert]) { granted, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Handle the error here.
                    self.error = error.localizedDescription
                    print(error.localizedDescription)
                    return
                }
                
                self.error = nil
            }
        }
    }
    
    func resetNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
}
