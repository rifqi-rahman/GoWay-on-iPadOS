//
//  GoWay_iPadOSApp.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 10/05/25.
//

import SwiftUI
import UIKit

@main
struct GoWay_iPadOSApp: App {
    @State private var navigationItem: SearchableItem?
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        // Donate shortcuts to Siri
        SiriShortcutsManager.shared.donateRestroomShortcut()
        SiriShortcutsManager.shared.donateShowerRoomShortcut()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(navigationItem: $navigationItem)
                .onOpenURL { url in
                    handleIncomingURL(url)
                }
                .onContinueUserActivity("com.goway.ipadapp.navigateToRestroom") { userActivity in
                    if let item = SiriShortcutsManager.shared.handleShortcut(activity: userActivity) {
                        navigationItem = item
                    }
                }
                .onContinueUserActivity("com.goway.ipadapp.navigateToShowerRoom") { userActivity in
                    if let item = SiriShortcutsManager.shared.handleShortcut(activity: userActivity) {
                        navigationItem = item
                    }
                }
        }
        .handlesExternalEvents(matching: ["com.goway.ipadapp.navigateToRestroom", "com.goway.ipadapp.navigateToShowerRoom"])
    }
    
    // Handle incoming URLs or user activities
    private func handleIncomingURL(_ url: URL) {
        // Check if the URL matches our shortcuts
        if url.absoluteString.contains("navigateToRestroom") {
            if let item = SearchableItem.sampleData().first(where: { $0.name == "Restroom" }) {
                navigationItem = item
            }
        } else if url.absoluteString.contains("navigateToShowerRoom") {
            if let item = SearchableItem.sampleData().first(where: { $0.name == "Shower Room" }) {
                navigationItem = item
            }
        }
    }
}

// ContentView to handle state and events
struct ContentView: View {
    @Binding var navigationItem: SearchableItem?
    
    var body: some View {
        if let item = navigationItem {
            NavigationView(item: item)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Back to Home") {
                            navigationItem = nil
                        }
                    }
                }
        } else {
            HomeView()
                .onReceive(NotificationCenter.default.publisher(for: Notification.Name("NavigateToLocation"))) { notification in
                    if let item = notification.userInfo?["item"] as? SearchableItem {
                        navigationItem = item
                    }
                }
        }
    }
}





