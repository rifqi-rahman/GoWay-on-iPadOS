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

// Sample navigation data provider
class NavigationDataRestroom {
    static func getRestroomSteps() -> [NavigationStep] {
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
                description: "Now, Turn Right",
                imageName: "restroom_step5"
            )
        ]
    }
} 
