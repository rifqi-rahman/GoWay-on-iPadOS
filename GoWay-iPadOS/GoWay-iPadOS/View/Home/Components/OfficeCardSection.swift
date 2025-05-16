//
//  OfficeCardSection.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct OfficeCard: View {
    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 340, height: 230)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0, green: 0.28, blue: 0.43).opacity(0.9), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.17, green: 0.59, blue: 0.83).opacity(0.23), location: 0.74),
                            Gradient.Stop(color: Color(red: 0.18, green: 0.57, blue: 0.85).opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 1),
                        endPoint: UnitPoint(x: 0.5, y: 0.26)
                    )
                )
                .background(
                    Image("Hero Banner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 340)
                        .clipped()
                )
                .cornerRadius(21)
                .padding(4)
            
            
                
                Text("NTT DATA")
                    .font(Font.custom("Bebas Neue", size: 32))
                    .foregroundColor(.white)
                    .padding(20)
                    .frame(width: 340, height: 230, alignment: .bottomLeading)
                    
            
            
            
        }
        
    }
}

struct OfficeCardSection: View {
    private let officeItems = SearchableItem.sampleData().filter { $0.category == .office }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Office")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(officeItems) { item in
                        LocationCard(item: item)
                            .frame(width: 340, height: 230)
                    }
                }
            }
        }
    }
}

#Preview {
    OfficeCardSection()
}

