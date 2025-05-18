//
//  StepByStepNavigation.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 14/05/25.
//

import SwiftUI
struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

struct StepCard: View {
    var navigationStep: NavigationStep
        
    var body: some View {
        HStack {
            
            VStack(spacing: 0) {
                    // Circle indicator
                Circle()
                .stroke(Color.black, lineWidth: 2)
                .background(Circle().fill(Color.white))
                .frame(width: 20, height: 20)
                .padding(.top, 0)
                                
                    // Dashed line to next step (only if not the last step)
               
                    DashedLine()
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [15, 10]))
                .frame(width: 2, height: 410)
                .foregroundColor(.black)
            }
            
            .padding(.leading, 30)

            
            VStack {
                Text(navigationStep.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .frame(width: 714, height: 27, alignment: .leading)
                
                Text(navigationStep.description)
                    .font(Font.custom("Inter", size: 20))
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                    .frame(width: 714, height: 27, alignment: .leading)
                
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
    }
    
#Preview {
    StepCard(navigationStep: NavigationDataRestroom.getNavigationSteps().first!)
}


