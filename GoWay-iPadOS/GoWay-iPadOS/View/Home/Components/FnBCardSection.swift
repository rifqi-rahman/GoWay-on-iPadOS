//
//  FnBCardSection.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct FnBCard: View {
    
    var title: String
    var imageName: String
    var description: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 340, height: 230)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0.41, green: 0.43, blue: 0).opacity(0.9), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.83, green: 0.73, blue: 0.17).opacity(0.23), location: 0.74),
                    Gradient.Stop(color: Color(red: 0.85, green: 0.79, blue: 0.18).opacity(0), location: 1.00),
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
          
          
              
              Text("Alfamart")
                  .font(Font.custom("Bebas Neue", size: 32))
                  .foregroundColor(.white)
                  .padding(20)
                  .frame(width: 340, height: 230, alignment: .bottomLeading)
                  
            }
        }
    }


struct FnBCardSection: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Food & Beverages")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 0)
                    .padding(.top,16)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    FnBCard(title: "Alfamart", imageName: "alfamart", description: "")
                    FnBCard(title: "Canteen", imageName: "canteen", description: "")
                    }
                
                .padding(.leading,0)
                    }
                }
        .padding(.leading, 24)
            }
}

#Preview {
    FnBCardSection()
}
