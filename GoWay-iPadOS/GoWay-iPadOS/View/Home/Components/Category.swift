//
//  Category.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct Category: View {
    var categoryName: String
    var categoryColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 33)
                .fill(categoryColor)
                .frame(width: 100, height: 30)
    
            Text(categoryName)
                .font(.subheadline)
                .foregroundColor(.black)
                .opacity(0.9)
        }
        .padding(.leading, 24)
//        .frame(width: 340, alignment: .bottomLeading)
    }
}

#Preview {
    Category(categoryName: "Facility", categoryColor: .facilityCategory)
}
