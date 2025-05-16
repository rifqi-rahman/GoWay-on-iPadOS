//
//  FacilityCardSection.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct FacilityIcons: View {
    var iconName: String
    var iconTitle: String
    
    private var facilityItem: SearchableItem {
        SearchableItem.sampleData().first { $0.name == iconTitle }!
    }
    
    var body: some View {
        NavigationLink(value: facilityItem) {
            VStack(spacing: 12) {
                Circle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .frame(width: 64, height: 64)
                    .overlay(
                        Image(systemName: iconName)
                            .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 0.02, green: 0.39, blue: 0.13))
                    )
            
            Text(iconTitle)
                    .font(.system(size: 16))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
                    .frame(maxWidth: 80)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .buttonStyle(.plain)
    }
}

struct FacilityCardSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                Text("Facility")
                    .font(.title2)
                    .fontWeight(.bold)
                .padding(.bottom, 14)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                    .frame(height: 220)
                        .background(Color(red: 0.02, green: 0.39, blue: 0.13))
                        .cornerRadius(16)
                    
                HStack(alignment: .top, spacing: 0) {
                    Spacer()
                        FacilityIcons(iconName: "figure.stand.dress.line.vertical.figure", iconTitle: "Restroom")
                    Spacer()
                        FacilityIcons(iconName: "shower.fill", iconTitle: "Shower Room")
                    Spacer()
                        FacilityIcons(iconName: "car.fill", iconTitle: "Parking Area")
                    Spacer()
                        FacilityIcons(iconName: "door.french.open", iconTitle: "Auditorium")
                    Spacer()
                        FacilityIcons(iconName: "hands.and.sparkles.fill", iconTitle: "Prayer Room")
                    Spacer()
                    FacilityIcons(iconName: "headset", iconTitle: "Front Office")
            Spacer()
                }
            }
        }
    }
}

#Preview {
    FacilityCardSection()
        .frame(height: 300)
}
