import SwiftUI
import Intents

// MARK: - Siri Shortcuts Manager
class SiriShortcutsManager {
    
    static let shared = SiriShortcutsManager()
    
    // Donate Restroom navigation shortcut to Siri
    func donateRestroomShortcut() {
        // Get the SearchableItem for restroom
        guard let restroomItem = SearchableItem.sampleData().first(where: { $0.name == "Restroom" }) else {
            return
        }
        
        // Create a user activity for navigating to restroom
        let activity = NSUserActivity(activityType: "com.goway.ipadapp.navigateToRestroom")
        activity.title = "Navigate to Restroom"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.suggestedInvocationPhrase = "Find Restroom in GOP9"
        
        // Add the userInfo needed for navigation
        activity.userInfo = ["destination": "Restroom"]
        
        // Donate the activity to the system
        activity.becomeCurrent()
    }
    
    // Donate Shower Room navigation shortcut to Siri
    func donateShowerRoomShortcut() {
        // Get the SearchableItem for shower room
        guard let showerRoomItem = SearchableItem.sampleData().first(where: { $0.name == "Shower Room" }) else {
            return
        }
        
        // Create a user activity for navigating to shower room
        let activity = NSUserActivity(activityType: "com.goway.ipadapp.navigateToShowerRoom")
        activity.title = "Navigate to Shower Room"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.suggestedInvocationPhrase = "Find Shower Room in GOP9"
        
        // Add the userInfo needed for navigation
        activity.userInfo = ["destination": "Shower Room"]
        
        // Donate the activity to the system
        activity.becomeCurrent()
    }
    
    // Handle shortcuts when selected from Siri or Shortcuts app
    func handleShortcut(activity: NSUserActivity) -> SearchableItem? {
        guard let destination = activity.userInfo?["destination"] as? String else {
            return nil
        }
        
        // Find the corresponding item
        return SearchableItem.sampleData().first { $0.name == destination }
    }
} 