import Flutter
import UIKit
import Firebase
import FirebaseMessaging

@main
@objc class AppDelegate: FlutterAppDelegate {
    /// Shared flag for privacy screen (controlled via method channel)
    static var privacyScreenEnabled: Bool = true
    private var privacyView: UIView?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()

        // Set notification delegate (permission is requested from Flutter side)
        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()

        // Set FCM messaging delegate
        Messaging.messaging().delegate = self

        // Register plugins
        GeneratedPluginRegistrant.register(with: self)

        let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)

        // Setup method channels
        if let controller = window?.rootViewController as? FlutterViewController {
            AppDelegate.setupMethodChannels(messenger: controller.binaryMessenger)
        }

        return result
    }

    // MARK: - Privacy Screen

    override func applicationWillResignActive(_ application: UIApplication) {
        super.applicationWillResignActive(application)
        if AppDelegate.privacyScreenEnabled {
            showPrivacyView()
        }
    }

    override func applicationDidBecomeActive(_ application: UIApplication) {
        super.applicationDidBecomeActive(application)
        removePrivacyView()
    }

    private func showPrivacyView() {
        guard privacyView == nil, let window = self.window else { return }

        let overlay = UIView(frame: window.bounds)
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.backgroundColor = UIColor(red: 0.04, green: 0.04, blue: 0.04, alpha: 1.0) // #0A0A0A

        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = overlay.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.addSubview(blurView)

        if let logoImage = UIImage(named: "HashLogo") {
            let imageView = UIImageView(image: logoImage)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            imageView.center = overlay.center
            imageView.layer.cornerRadius = 20
            imageView.clipsToBounds = true
            overlay.addSubview(imageView)
        }

        window.addSubview(overlay)
        privacyView = overlay
    }

    private func removePrivacyView() {
        privacyView?.removeFromSuperview()
        privacyView = nil
    }

    // MARK: - Method Channels

    static func setupMethodChannels(messenger: FlutterBinaryMessenger) {
        // Platform channel for secure time
        let systemChannel = FlutterMethodChannel(
            name: "com.hash.app/system",
            binaryMessenger: messenger
        )

        systemChannel.setMethodCallHandler { (call, result) in
            switch call.method {
            case "getSystemUptime":
                let uptimeSeconds = ProcessInfo.processInfo.systemUptime
                result(Int64(uptimeSeconds * 1000))
            case "getElapsedRealtime":
                let uptimeSeconds = ProcessInfo.processInfo.systemUptime
                result(Int64(uptimeSeconds * 1000))
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        // Platform channel for notification preferences sync
        let notificationPrefsChannel = FlutterMethodChannel(
            name: "com.hash.app/notification_preferences",
            binaryMessenger: messenger
        )

        notificationPrefsChannel.setMethodCallHandler { (call, result) in
            switch call.method {
            case "syncNotificationPreferences":
                guard let args = call.arguments as? [String: Any],
                      let contentLevel = args["contentLevel"] as? String,
                      let customTitle = args["customTitle"] as? String,
                      let customBody = args["customBody"] as? String else {
                    result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
                    return
                }

                let notificationSound = args["notificationSound"] as? String ?? "shadow"

                let messageNotificationsEnabled = args["messageNotificationsEnabled"] as? Bool ?? true
                let callNotificationsEnabled = args["callNotificationsEnabled"] as? Bool ?? true

                if let userDefaults = UserDefaults(suiteName: "group.com.hash.messenger") {
                    userDefaults.set(contentLevel, forKey: "notificationContentLevel")
                    userDefaults.set(customTitle, forKey: "customNotificationTitle")
                    userDefaults.set(customBody, forKey: "customNotificationBody")
                    userDefaults.set(notificationSound, forKey: "notificationSound")
                    userDefaults.set(messageNotificationsEnabled, forKey: "messageNotificationsEnabled")
                    userDefaults.set(callNotificationsEnabled, forKey: "callNotificationsEnabled")
                    userDefaults.synchronize()
                    result(true)
                } else {
                    result(FlutterError(code: "USERDEFAULTS_ERROR", message: "Could not access App Group UserDefaults", details: nil))
                }

            case "syncContactNames":
                guard let args = call.arguments as? [String: Any],
                      let contactNames = args["contactNames"] as? [String: String] else {
                    result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
                    return
                }

                if let userDefaults = UserDefaults(suiteName: "group.com.hash.messenger") {
                    userDefaults.set(contactNames, forKey: "contactNames")
                    userDefaults.synchronize()
                    result(true)
                } else {
                    result(FlutterError(code: "USERDEFAULTS_ERROR", message: "Could not access App Group UserDefaults", details: nil))
                }

            case "syncContactNotificationSettings":
                guard let args = call.arguments as? [String: Any],
                      let contactSettingsJson = args["contactSettingsJson"] as? String else {
                    result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
                    return
                }

                if let userDefaults = UserDefaults(suiteName: "group.com.hash.messenger") {
                    // Store as JSON string to avoid NSNull issues
                    userDefaults.set(contactSettingsJson, forKey: "contactNotificationSettingsJson")
                    userDefaults.synchronize()
                    result(true)
                } else {
                    result(FlutterError(code: "USERDEFAULTS_ERROR", message: "Could not access App Group UserDefaults", details: nil))
                }

            case "removeAllDeliveredNotifications":
                UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                result(true)

            default:
                result(FlutterMethodNotImplemented)
            }
        }

        // Platform channel for app icon switching
        let appIconChannel = FlutterMethodChannel(
            name: "com.hash.app/app_icon",
            binaryMessenger: messenger
        )

        appIconChannel.setMethodCallHandler { (call, result) in
            switch call.method {
            case "setAppIcon":
                let args = call.arguments as? [String: Any]
                let iconId = args?["iconId"] as? String
                if UIApplication.shared.supportsAlternateIcons {
                    UIApplication.shared.setAlternateIconName(iconId) { error in
                        if let error = error {
                            result(FlutterError(code: "ICON_ERROR", message: error.localizedDescription, details: nil))
                        } else {
                            result(true)
                        }
                    }
                } else {
                    result(FlutterError(code: "NOT_SUPPORTED", message: "Alternate icons not supported", details: nil))
                }
            case "getAppIcon":
                let iconName = UIApplication.shared.alternateIconName
                result(iconName ?? "default")
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        // Platform channel for privacy screen
        let privacyChannel = FlutterMethodChannel(
            name: "com.hash.app/privacy_screen",
            binaryMessenger: messenger
        )

        privacyChannel.setMethodCallHandler { (call, result) in
            switch call.method {
            case "setPrivacyScreen":
                guard let args = call.arguments as? [String: Any],
                      let enabled = args["enabled"] as? Bool else {
                    result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
                    return
                }
                AppDelegate.privacyScreenEnabled = enabled
                if !enabled {
                    DispatchQueue.main.async {
                        (UIApplication.shared.delegate as? AppDelegate)?.removePrivacyView()
                    }
                }
                result(true)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }

    // MARK: - APNs

    override func application(_ application: UIApplication,
                              didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
}

// MARK: - MessagingDelegate
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let tokenDict = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: tokenDict
        )
    }
}

// MARK: - UNUserNotificationCenterDelegate (Foreground notifications)
extension AppDelegate {
    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([])
    }
}
