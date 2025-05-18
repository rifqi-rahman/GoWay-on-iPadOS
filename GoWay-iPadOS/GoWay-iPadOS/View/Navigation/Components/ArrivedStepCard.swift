//
//  ArrivedStepCard.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 18/05/25.
//

import SwiftUI

struct ArrivedStepCard: View {
    var body: some View {
        HStack {
            
            VStack(spacing: 0) {
                    // Circle indicator
                Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.blue)
                .frame(width: 25, height: 25)
                .padding(.top, 0)
                
                Spacer()
            }
            .frame(height: 54, alignment: .leading)
            .padding(.leading, 33)

            
            VStack {
                Text("You're Arrived!")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .frame(width: 714, height: 27, alignment:.leading)
            
                Text("You can go anywhere with GoWay! Explore more destinations at GOP 9!")
                    .font(Font.custom("Inter", size: 20))
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                    .frame(width: 714, height: 27, alignment: .leading)
            }
            .frame(width: 714 ,alignment: .leading)
            .padding(20)
            
        }
        .padding(.bottom, 250)
//        HStack {
//            
////            VStack(spacing: 0) {
//                    // Circle indicator
//                Image(systemName: "checkmark.circle.fill")
//                    .font(.system(size: 25))
//                .foregroundStyle(Color.blue)
//                .frame(width: 50, height: 50, alignment: .top)
//                .padding(.top, 0)
////            }
//            .padding(.leading, 30)
//
//            
//            VStack {
//                Text("You're Arrived!")
//                    .font(.system(size: 24, weight: .bold))
//                    .foregroundColor(.black)
//                    .frame(width: 714, height: 27, alignment: .leading)
//                
//                Text("Now, you can go anywhere with GoWay")
//                    .font(Font.custom("Inter", size: 20))
//                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
//                    .frame(width: 714, height: 27, alignment: .leading)
//            }
////            .frame(width: 714, alignment: .leading)
////            .padding(20)
////            .padding(.bottom, 300)
//            
//        }
//        .frame(width: 714, alignment: .leading)
//        .padding(20)
//        .padding(.bottom, 300)
    }
}

#Preview {
    ArrivedStepCard()
}

//
//    
//    VStack {
//        Text(navigationStep.title)
//            .font(.system(size: 24, weight: .bold))
//            .foregroundColor(.black)
//            .frame(width: 714, height: 27, alignment: .leading)
//        
//        Text(navigationStep.description)
//            .font(Font.custom("Inter", size: 20))
//            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
//            .frame(width: 714, height: 27, alignment: .leading)
//        
//        Rectangle()
//            .foregroundColor(.clear)
//            .frame(width: 714, height: 366)
//            .background(
//                Image(navigationStep.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 714, height: 366)
//                    .clipped()
//            )
//            .cornerRadius(21)
//    }
//    
//    .frame(width: 714, alignment: .leading)
//    .padding(20)
//}
