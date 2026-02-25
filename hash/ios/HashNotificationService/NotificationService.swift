//
//  NotificationService.swift
//  HashNotificationService
//
//  Created by Mathéo on 03/02/2026.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

        guard let bestAttemptContent = bestAttemptContent else {
            contentHandler(request.content)
            return
        }

        // Read notification preferences from App Group UserDefaults
        // The main app saves preferences here for the extension to read
        if let userDefaults = UserDefaults(suiteName: "group.com.hash.messenger") {
            // Check if message notifications are globally enabled
            // Default to true if not set (first launch / migration)
            let messageNotificationsEnabled = userDefaults.object(forKey: "messageNotificationsEnabled") as? Bool ?? true
            if !messageNotificationsEnabled {
                // Suppress the notification entirely by delivering empty content
                let emptyContent = UNMutableNotificationContent()
                contentHandler(emptyContent)
                return
            }

            // Check per-contact notification settings (stored as JSON string)
            let senderHashId = request.content.userInfo["sender_hash_id"] as? String
            if let senderHashId = senderHashId,
               let jsonString = userDefaults.string(forKey: "contactNotificationSettingsJson"),
               let jsonData = jsonString.data(using: .utf8),
               let allSettings = try? JSONSerialization.jsonObject(with: jsonData) as? [String: [String: Any]],
               let settings = allSettings[senderHashId] {

                // Check if notifications are disabled for this contact
                let contactNotifEnabled = settings["notificationsEnabled"] as? Bool ?? true
                if !contactNotifEnabled {
                    let emptyContent = UNMutableNotificationContent()
                    contentHandler(emptyContent)
                    return
                }

                // Check if contact is muted
                if let mutedUntilStr = settings["mutedUntil"] as? String, mutedUntilStr != "null" {
                    let formatter = ISO8601DateFormatter()
                    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                    if let mutedUntil = formatter.date(from: mutedUntilStr) ?? ISO8601DateFormatter().date(from: mutedUntilStr) {
                        if mutedUntil > Date() {
                            let emptyContent = UNMutableNotificationContent()
                            contentHandler(emptyContent)
                            return
                        }
                    }
                }
            }

            let contentLevel = userDefaults.string(forKey: "notificationContentLevel") ?? "discrete"
            let customTitle = userDefaults.string(forKey: "customNotificationTitle") ?? ""
            let customBody = userDefaults.string(forKey: "customNotificationBody") ?? ""

            // Modify notification based on user preferences
            switch contentLevel {
            case "custom":
                bestAttemptContent.title = customTitle.isEmpty ? "Hash" : customTitle
                bestAttemptContent.body = customBody.isEmpty ? "Nouveau message" : customBody
            default:
                bestAttemptContent.title = "Hash"
                bestAttemptContent.body = "Nouveau message"
            }

            // Set custom notification sound
            let soundName = userDefaults.string(forKey: "notificationSound") ?? "shadow"
            bestAttemptContent.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "\(soundName).caf"))
        }

        contentHandler(bestAttemptContent)
    }

    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content,
        // otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
