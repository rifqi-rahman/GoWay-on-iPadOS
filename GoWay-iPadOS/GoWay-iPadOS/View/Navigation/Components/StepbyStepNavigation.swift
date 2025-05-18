//
//  StepbyStepNavigation.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 15/05/25.
//

import SwiftUI

struct StepbyStepNavigation: View {
    let navigationStep: [NavigationStep]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(navigationStep) { step in
                    StepCard(navigationStep: step)
                }
                ArrivedStepCard()
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StepbyStepNavigation(navigationStep: NavigationDataRestroom.getNavigationSteps())
}
