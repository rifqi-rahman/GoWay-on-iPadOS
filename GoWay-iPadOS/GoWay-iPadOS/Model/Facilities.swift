//
//  Facilities.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 10/05/25.
//

import Foundation

//MODEL FACILITIES

struct Facilities {
    let id: UUID
    let name: String
    let imageName: String
    let stepGuides: [FacilitiesStepGuide]
    
    init(id: UUID = UUID(), name: String,  imageName: String, stepGuides: [FacilitiesStepGuide] = [FacilitiesStepGuide(image: "coming-soon", instruction: "Coming soon", description: "Coming soon")]) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.stepGuides = stepGuides
    }
    
}

//MODEL STEP-BY-STEP NAVIGATION UNTUK TIAP FACILITY
struct FacilitiesStepGuide: Codable {
    let image: String
    let instruction: String
    let description: String
    
    init(image: String, instruction: String, description: String) {
        self.image = image
        self.instruction = instruction
        self.description = description
    }
}


