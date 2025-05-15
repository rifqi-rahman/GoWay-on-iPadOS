//
//  StepbyStepNavigation.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 15/05/25.
//

import SwiftUI

struct StepbyStepNavigation: View {
    var body: some View {
        ScrollView {
            VStack {
                StepCard()
                StepCard()
                StepCard()
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StepbyStepNavigation()
}
