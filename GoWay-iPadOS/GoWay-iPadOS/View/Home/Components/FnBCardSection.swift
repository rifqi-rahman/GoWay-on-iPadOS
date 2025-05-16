//
//  FnBCardSection.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct FnBCardSection: View {
    private let fnbItems = SearchableItem.sampleData().filter { $0.category == .fnb }
    
    var body: some View {
        VStack {
            HStack {
                Text("Food & Beverages")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 0)
                    .padding(.top, 16)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(fnbItems) { item in
                        LocationCard(item: item)
                    }
                }
                .padding(.leading, 0)
            }
        }
        .padding(.leading, 24)
    }
}

#Preview {
    FnBCardSection()
}
