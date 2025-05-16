//
//  NavigationModels.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 14/05/25.
//

import Foundation
import SwiftUI

// Model for navigation steps
struct NavigationStep: Identifiable {
    let id = UUID()
    let stepNumber: Int
    let title: String
    let description: String
    let imageName: String // This will be the name of the image for every destination
}

// Navigation data provider protocol
protocol NavigationDataProvider {
    static func getNavigationSteps() -> [NavigationStep]
}

// Data Navigation for Restroom
class NavigationDataRestroom: NavigationDataProvider {
    static func getNavigationSteps() -> [NavigationStep] {
        return [
            NavigationStep(
                stepNumber: 1,
                title: "Starting Point",
                description: "Find this entrance in GOP 9.",
                imageName: "restroom_step1"
            ),
            NavigationStep(
                stepNumber: 2,
                title: "Turn Left",
                description: "Turn left at this corner bruh.",
                imageName: "restroom_step2"
            ),
            NavigationStep(
                stepNumber: 3,
                title: "Turn Left",
                description: "Look at the hall way, turn Left again bruh",
                imageName: "restroom_step3"
            ),
            NavigationStep(
                stepNumber: 4,
                title: "Go Straight",
                description: "Straight bro, don't cross",
                imageName: "restroom_step4"
            ),
            NavigationStep(
                stepNumber: 5,
                title: "Turn Right",
                description: "Now, You'll see the restroom's sign on the right",
                imageName: "restroom_step5"
            ),
            NavigationStep(
                stepNumber: 6,
                title: "You're Arrived!",
                description: "Now, Have a nice rest!",
                imageName: ""
            )
        ]
    }
} 

// Data Navigation for Shower Room
class NavigationDataShower: NavigationDataProvider {
    static func getNavigationSteps() -> [NavigationStep] {
        return [
            NavigationStep(
                stepNumber: 1,
                title: "Starting Point",
                description: "Find this entrance in GOP 9.",
                imageName: "shower_step1"
            ),
            NavigationStep(
                stepNumber: 2,
                title: "Turn Left",
                description: "Turn left at this corner bruh.",
                imageName: "shower_step2"
            ),
            NavigationStep(
                stepNumber: 3,
                title: "Turn Left",
                description: "Look at the hall way, turn Left again bruh",
                imageName: "shower_step3"
            ),
            NavigationStep(
                stepNumber: 4,
                title: "Go Straight",
                description: "Straight bro, don't cross",
                imageName: "shower_step4"
            ),
            NavigationStep(
                stepNumber: 5,
                title: "Turn Right",
                description: "Now, Turn Right",
                imageName: "shower_step5"
            ),
            NavigationStep(
                stepNumber: 6,
                title: "You're Arrived!",
                description: "Now, Have a nice rest!",
                imageName: ""
            )
        ]
    }
}

// Default navigation data for locations without specific navigation steps
class NavigationDataComingSoon: NavigationDataProvider {
    static func getNavigationSteps() -> [NavigationStep] {
        return [
            NavigationStep(
                stepNumber: 1,
                title: "Coming Soon",
                description: "Navigation steps for this location are coming soon!",
                imageName: "coming_soon"
            )
        ]
    }
}

// Navigation data manager
class NavigationDataManager {
    static func getNavigationSteps(for item: SearchableItem) -> [NavigationStep] {
        switch item.name {
        case "Restroom":
            return NavigationDataRestroom.getNavigationSteps()
        case "Shower Room":
            return NavigationDataShower.getNavigationSteps()
        default:
            return NavigationDataComingSoon.getNavigationSteps()
        }
    }
} 
