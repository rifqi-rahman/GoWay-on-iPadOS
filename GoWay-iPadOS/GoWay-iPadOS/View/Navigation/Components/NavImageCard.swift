//
//  NavImageCard.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 12/05/25.
//

import SwiftUI

struct NavImageCard: View {
    var body: some View {
        ZStack {
            //WHITE CARD IN THE BACK
            Rectangle()
              .foregroundColor(.white)
              .frame(width: 470, height: 770)
              .cornerRadius(21)
              .overlay(
                RoundedRectangle(cornerRadius: 21)
                  .inset(by: 1)
                  .stroke(.black, lineWidth: 2)
              )
              .frame(width: 474, height: 770)
            
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 470, height: 414)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0, green: 0.43, blue: 0.13).opacity(0.9), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.17, green: 0.83, blue: 0.31).opacity(0.23), location: 0.74),
                            Gradient.Stop(color: Color(red: 0.18, green: 0.85, blue: 0.32).opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 1),
                        endPoint: UnitPoint(x: 0.5, y: 0.26)
                    )
                )
                .background(
                    Image("Hero Banner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 470, height: 414)
                        .clipped()
                )
                .cornerRadius(21)
                .overlay(
                    RoundedRectangle(cornerRadius: 21)
                        .inset(by: 1)
                        .stroke(.black, lineWidth: 2)
                )
            
            VStack {
                Spacer()
                
                Category(categoryName: "Facility", categoryColor: .facilityCategory)
                    .frame(width: 470, alignment: .bottomLeading)
                
                Text("Alfamart")
                    .font(Font.custom("Bebas Neue", size: 48))
                    .foregroundColor(.white)
                    .padding(.leading, 24)
                    .padding(.bottom)
                    .frame(width: 470, height: 60, alignment: .leading)
                
            }.frame(width: 470, height: 414)
            
            
            //PARAGRAPH & INFORMATIONS IN THE CARD
            VStack {
                Spacer()
                
                Text("A restroom is a public room containing toilets and sinks for personal sanitation. This is Shower room LMAO")
                    .font(Font.custom("Inter", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                    .frame(width: 320, height: 91.94405, alignment: .top)
            }
        }
    }
}

#Preview {
    NavImageCard()
}
