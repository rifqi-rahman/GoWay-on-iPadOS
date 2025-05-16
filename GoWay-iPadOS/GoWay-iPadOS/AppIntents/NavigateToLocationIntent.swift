import AppIntents
import SwiftUI

enum LocationType: String, AppEnum {
    case restroom = "Restroom"
    case showerRoom = "Shower Room"
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        return "Location Type"
    }
    
    static var caseDisplayRepresentations: [LocationType: DisplayRepresentation] {
        [
            .restroom: "Restroom",
            .showerRoom: "Shower Room"
        ]
    }
}

struct LocationNotFoundError: Error {
    let description: String
}

struct NavigateToLocationIntent: AppIntent {
    static var title: LocalizedStringResource = "Navigate to Location"
    static var description: IntentDescription = IntentDescription("Navigate to a specific location in GOP9")
    
    @Parameter(title: "Location")
    var location: LocationType
    
    init() {
        self.location = .restroom
    }
    
    init(location: LocationType) {
        self.location = location
    }
    
    func perform() async throws -> IntentResult {
        // Get the corresponding SearchableItem
        let allItems = SearchableItem.sampleData()
        guard let targetItem = allItems.first(where: { $0.name == location.rawValue }) else {
            throw LocationNotFoundError(description: "Location not found")
        }
        
        // Post notification to trigger navigation
        NotificationCenter.default.post(
            name: Notification.Name("NavigateToLocation"),
            object: nil,
            userInfo: ["item": targetItem]
        )
        
        return .result()
    }
}

// Shortcut suggestions with improved phrases for natural language
struct NavigateToLocationShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        return [
            .init(
                intent: NavigateToLocationIntent(location: .restroom),
                phrases: [
                    "Navigate to Restroom in GoWay",
                    "Show me the way to Restroom in GOP9",
                    "Where is the Restroom in GOP9",
                    "Take me to the Restroom",
                    "I need to find the Restroom"
                ],
                shortTitle: "Navigate to Restroom",
                systemImageName: "figure.stand.dress.line.vertical.figure"
            ),
            
            .init(
                intent: NavigateToLocationIntent(location: .showerRoom),
                phrases: [
                    "Navigate to Shower Room in GoWay",
                    "Show me the way to Shower Room in GOP9",
                    "Where is the Shower Room in GOP9",
                    "Take me to the Shower Room",
                    "I need to find the Shower Room"
                ],
                shortTitle: "Navigate to Shower Room",
                systemImageName: "shower.fill"
            )
        ]
    }
}

// Environment key for navigation state
private struct NavigationStateKey: EnvironmentKey {
    static let defaultValue = NavigationState()
}

extension EnvironmentValues {
    var navigationState: NavigationState {
        get { self[NavigationStateKey.self] }
        set { self[NavigationStateKey.self] = newValue }
    }
}

// Navigation State object to handle app state
class NavigationState: ObservableObject {
    @Published var selectedItem: SearchableItem?
    
    init(selectedItem: SearchableItem? = nil) {
        self.selectedItem = selectedItem
    }
}

// Navigation View that will be presented
struct NavigationView: View {
    let item: SearchableItem
    
    var body: some View {
        // Your existing navigation view implementation
        Text("Navigating to \(item.name)")
            // Add your navigation view implementation here
    }
} 