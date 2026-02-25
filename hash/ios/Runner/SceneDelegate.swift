import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {
    private var privacyView: UIView?

    /// Static reference for cross-delegate privacy view removal
    private static weak var currentInstance: SceneDelegate?

    override func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        SceneDelegate.currentInstance = self

        // FlutterSceneDelegate + UIKit handle:
        // - Loading Main.storyboard → creating FlutterViewController
        // - FlutterLaunchEngine creates and runs the engine lazily
        // - Window creation and display
        super.scene(scene, willConnectTo: session, options: connectionOptions)

        // Bridge the Flutter window to AppDelegate for legacy plugin compatibility
        // (e.g. flutter_contacts accesses UIApplication.shared.delegate!.window!!)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window = self.window
        }

        // Register plugins and method channels now that window + FlutterVC exist
        if let flutterVC = self.window?.rootViewController as? FlutterViewController {
            GeneratedPluginRegistrant.register(with: flutterVC.engine)
            AppDelegate.setupMethodChannels(messenger: flutterVC.engine.binaryMessenger)
        }
    }

    override func sceneWillResignActive(_ scene: UIScene) {
        super.sceneWillResignActive(scene)
        if AppDelegate.privacyScreenEnabled {
            showPrivacyView()
        }
    }

    override func sceneDidBecomeActive(_ scene: UIScene) {
        super.sceneDidBecomeActive(scene)
        removePrivacyView()
    }

    /// Called from AppDelegate when privacy screen is disabled via method channel
    static func removePrivacyViewIfNeeded() {
        currentInstance?.removePrivacyView()
    }

    // MARK: - Privacy Screen

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
}
