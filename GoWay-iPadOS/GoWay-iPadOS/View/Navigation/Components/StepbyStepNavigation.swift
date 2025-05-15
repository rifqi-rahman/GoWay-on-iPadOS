//
//  StepbyStepNavigation.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 15/05/25.
//

import SwiftUI

struct StepbyStepNavigation: View {
    var navigationStep : [NavigationStep] = NavigationDataRestroom.getRestroomSteps()
    
    var body: some View {
        ScrollView {
            VStack {
                StepCard(navigationStep: navigationStep[0])
                StepCard(navigationStep: navigationStep[1])
                StepCard(navigationStep: navigationStep[2])
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StepbyStepNavigation()
}
