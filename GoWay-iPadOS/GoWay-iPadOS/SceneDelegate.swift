import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // This handles Quick Action shortcuts (when you long-press the app icon)
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        // Handle the shortcut and notify our app
        handleQuickAction(shortcutItem)
        completionHandler(true)
    }
    
    private func handleQuickAction(_ shortcutItem: UIApplicationShortcutItem) {
        // Get the location name based on the shortcut type
        let locationName: String
        switch shortcutItem.type {
        case "com.goway.navigateToRestroom":
            locationName = "Restroom"
        case "com.goway.navigateToShowerRoom":
            locationName = "Shower Room"
        default:
            return
        }
        
        // Find the matching SearchableItem
        if let item = SearchableItem.sampleData().first(where: { $0.name == locationName }) {
            // Post notification to navigate
            NotificationCenter.default.post(
                name: Notification.Name("NavigateToLocation"),
                object: nil,
                userInfo: ["item": item]
            )
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        // Handle user activity continuation (e.g., from Shortcuts app)
        if let activityType = userActivity.activityType as String? {
            NotificationCenter.default.post(
                name: Notification.Name("NavigateToLocation"),
                object: nil,
                userInfo: ["shortcutType": activityType]
            )
        }
    }
} 