//
//  StepByStepNavigation.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 14/05/25.
//

import SwiftUI

struct StepCard: View {
    var navigationStep : NavigationStep
    var body : some View {
        //TITLE
        
        VStack {
            Text(navigationStep.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 714, height: 27, alignment: .leading)
            
            
            //DESCRIPTION
            Text("Find this entrance in GOP 9")
                .font(Font.custom("Inter", size: 20))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                .frame(width: 714, height: 27, alignment: .leading)
            
            //IMAGE step-by-step navigation
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 714, height: 366)
              .background(
                Image(navigationStep.imageName)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 714, height: 366)
                  .clipped()
              )
              .cornerRadius(21)
        }
        .frame(width: 714, alignment: .leading)
        .padding(20)
    }
    
}


