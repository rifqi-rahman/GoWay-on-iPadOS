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
            // WHITE CARD IN THE BACK
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 470, height: 770)
                .cornerRadius(21)
                .overlay(
                    RoundedRectangle(cornerRadius: 21)
                        .inset(by: 1)
                        .stroke(.black, lineWidth: 2)
                )
            
            VStack(spacing: 0) {
                // IMAGE SECTION WITH OVERLAY
                ZStack(alignment: .bottomLeading) {
                    // Image with green overlay
                    Image("Hero Banner") // Replace with your image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 470, height: 414)
                        .clipped()
                        .overlay(
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
                    
                    // Category and title
                    VStack(alignment: .leading, spacing: 8) {
                        // Category pill
                        Text("Facility")
                            .font(.system(size: 16))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color(red: 0.56, green: 0.93, blue: 0.56))
                            .cornerRadius(33)
                        
                        // Title
                        Text("RESTROOM")
                            .font(Font.custom("Bebas Neue", size: 48).weight(.bold))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 24)
                }
                .frame(width: 470, height: 414)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 21)
                        .stroke(.black, lineWidth: 2)
                        .clipShape(
                            RoundedCorner(radius: 20)
                        )
                )
                Spacer()
                
                // INFORMATION SECTION
                VStack(spacing: 24) {
                    // Opening hours
                    HStack {
                        Image(systemName: "clock")
                            .font(.system(size: 24))
                        
                        Text("08:00 - 21:00")
                            .font(.system(size: 20))
                    }
                    
                    // Accessibility icons
                    HStack(spacing: 40) {
                        ZStack {
                            Circle()
                                .fill(Color.green.opacity(0.2))
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "figure.roll")
                                .font(.system(size: 20))
                            
                        }
                        
                        ZStack {
                            Circle()
                                .fill(Color.green.opacity(0.2))
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "p.square.fill")
                                .font(.system(size: 20))
                        }
                    }
                    
                    
                    // Description
                    Text("A restroom is a public room containing toilets and sinks for personal sanitation. This is Shower room LMAO")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                        .padding(.horizontal, 50)
                        .padding(.bottom, 24)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.vertical, 24)
                .frame(width: 470)
            }
            .frame(width: 470, height: 770)
        }
    }
}

// Extension for rounded specific corners
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// Extension for View to apply rounded corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

#Preview {
    NavImageCard()
}
