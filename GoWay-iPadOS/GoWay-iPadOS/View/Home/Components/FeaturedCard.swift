//
//  FeaturedCard.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct FeaturedCard: View {
    var body: some View {
        
        
        
        VStack (alignment: .leading) {
//            HStack {
                Text("Featured")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 0)
                    .padding(.top,0)
                    
//                Spacer()
//                }
            
            ZStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 490, height: 220)
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
                      .frame(width: 490, height: 220)
                      .clipped()
                    
                  )
                  .cornerRadius(21)
                  .padding(0)
              
              
                  
                VStack {
                    Spacer()
                    
                    Category(categoryName: "F&B", categoryColor: .fnbCategory)
                        .frame(width: 490, alignment: .bottomLeading)

                    Text("Alfamart")
                        .font(Font.custom("Bebas Neue", size: 32))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.bottom, 20)
                        .frame(width: 490, alignment: .leading)

                }.frame(width: 490, height: 220)
                      
            }
        }
        
        .padding(.leading, 0)
        
        
    }
}

#Preview {
    FeaturedCard()
}
