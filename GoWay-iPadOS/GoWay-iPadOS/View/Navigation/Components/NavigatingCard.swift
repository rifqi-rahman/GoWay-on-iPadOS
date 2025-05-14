//
//  NavigatingCard.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct NavigatingCard: View {
    var body: some View {
        VStack {
            
            Text("You’re navigating to :")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            
            //GREEN CARD WITH IMAGE BACKGROUND
        }
        .frame(width: 474, height: 770)
    }
}

#Preview {
    NavigatingCard()
}
