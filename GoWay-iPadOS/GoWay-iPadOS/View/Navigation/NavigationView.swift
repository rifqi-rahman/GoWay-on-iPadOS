//
//  NavigationView.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Back button
            Button(action: {
                //handle action back button
            }
            
            ) {
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.blue)
                    
                    Text("Back")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 24)
          
            
            // Navigation title
            Text("You're navigating to :")
                .font(.system(size: 32, weight: .bold))
                .padding(.bottom, 16)
            
            // Main content: NavImageCard on left, StepByStepNavigation on right
            HStack(alignment: .top, spacing: 24) {
                // LEFT PANEL - Sticky NavImageCard
                NavImageCard()
                
                // FLEXIBLE-ADJUSTABLE DASHED LINE FOR PROGRESS LINE
                
                
                // RIGHT PANEL - Scrollable StepByStepNavigation
                 StepbyStepNavigation()
                
            }
        }
        .ignoresSafeArea(edges: .all)
        .frame(width: .infinity, height: .infinity)
        .padding(.horizontal, 0)
        .padding(.top, 16)
        
    }
}

#Preview {
    NavigationView()
}
