//
//  NavigationView.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct NavigationView: View {
    @Environment(\.dismiss) private var dismiss
    let item: SearchableItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Navigation title
            Text("You're navigating to :")
                .font(.system(size: 32, weight: .bold))
                .padding(.bottom, 16)
            
            // Main content: NavImageCard on left, StepByStepNavigation on right
            HStack(alignment: .top, spacing: 24) {
                // LEFT PANEL - Sticky NavImageCard
                NavImageCard(item: item)
                
                // RIGHT PANEL - Scrollable StepByStepNavigation
                StepbyStepNavigation(navigationStep: NavigationDataManager.getNavigationSteps(for: item))
            }
        }
        .ignoresSafeArea(edges: .all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 0)
        .padding(.top, 16)
    }
}

#Preview {
    NavigationView(item: SearchableItem.sampleData().first!)
}
