//
//  GoWay_iPadOSApp.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 10/05/25.
//

import SwiftUI
import AppIntents

@main
struct GoWay_iPadOSApp: App {
    @State private var selectedItem: SearchableItem?
    
    var body: some Scene {
        WindowGroup {
            if let item = selectedItem {
                NavigationView(item: item)
            } else {
                HomeView()
                    .onReceive(NotificationCenter.default.publisher(for: Notification.Name("NavigateToLocation"))) { notification in
                        if let item = notification.userInfo?["item"] as? SearchableItem {
                            selectedItem = item
                        }
                    }
            }
        }
        .commands {
            // Add Siri command support
            CommandsBuilder.buildCommands()
        }
        .appShortcuts {
            // Register app shortcuts
            NavigateToLocationShortcuts.appShortcuts
        }
    }
}

// Helper to build Siri commands
struct CommandsBuilder {
    static func buildCommands() -> Commands {
        Commands {
            SidebarCommands()
            
            // Add navigation commands
            CommandGroup(after: .newItem) {
                Button("Navigate to Restroom") {
                    Task {
                        try? await NavigateToLocationIntent(location: .restroom).perform()
                    }
                }
                .keyboardShortcut("R", modifiers: [.command, .shift])
                
                Button("Navigate to Shower Room") {
                    Task {
                        try? await NavigateToLocationIntent(location: .showerRoom).perform()
                    }
                }
                .keyboardShortcut("S", modifiers: [.command, .shift])
            }
        }
    }
}
