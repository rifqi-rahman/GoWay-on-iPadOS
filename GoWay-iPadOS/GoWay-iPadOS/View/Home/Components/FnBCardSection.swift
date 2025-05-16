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
        VStack(alignment: .leading, spacing: 8) {
                Text("Food & Beverages")
                    .font(.title2)
                    .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(fnbItems) { item in
                        LocationCard(item: item)
                            .frame(width: 340, height: 230)
                    }
                }
            }
        }
            }
}

#Preview {
    FnBCardSection()
}
