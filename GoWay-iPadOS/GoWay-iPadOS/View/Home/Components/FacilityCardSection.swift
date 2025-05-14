//
//  FacilityCardSection.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct FacilityIcons: View {
    var iconName: String/*?*/
    var iconTitle: String
    
    var body: some View {
        
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 80)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(64)
                
                Image(systemName: iconName /*?? "mosque-moon"*/)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(red: 0.02, green: 0.39, blue: 0.13))
                
            }
            .frame(width: 80, height: 90)
            
            Text(iconTitle)
              .font(Font.custom("SF Pro Display", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 93, alignment: .top)
        }
    }
}


struct FacilityCardSection: View {
    var body: some View {
        
//        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Facility")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 800, height: 220)
                        .background(Color(red: 0.02, green: 0.39, blue: 0.13))
                        .cornerRadius(16)
                    
                    HStack(alignment: .top, spacing: 65) {
                        FacilityIcons(iconName: "figure.stand.dress.line.vertical.figure", iconTitle: "Restroom")
                        FacilityIcons(iconName: "shower.fill", iconTitle: "Shower Room")
                        FacilityIcons(iconName: "car.fill", iconTitle: "Parking Area")
                        FacilityIcons(iconName: "door.french.open", iconTitle: "Auditorium")
                        FacilityIcons(iconName: "hands.and.sparkles.fill", iconTitle: "Prayer Room")
                        
                        //                    FacilityIcons(iconName: "mosque-moon", iconTitle: "Prayer Room")
                    }
                }
                .padding(0)
                
            }
            
            .frame(width: 811)
            .padding(.leading, 24)
            Spacer()
//        }
    }
}
#Preview {
    FacilityCardSection()
}
