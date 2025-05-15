//
//  ContentView.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 10/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    private let allItems = SearchableItem.sampleData()
    
    var filteredItems: [SearchableItem] {
        if searchText.isEmpty {
            return []
        }
        return allItems.filter { item in
            item.name.lowercased().contains(searchText.lowercased()) ||
            item.description.lowercased().contains(searchText.lowercased()) ||
            item.category.rawValue.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        ZStack {
            // Main content
            ScrollView {
                VStack {
                    Header(searchText: $searchText, isSearching: $isSearching)
                    if !isSearching {
                        HStack(alignment: .top) {
                            FacilityCardSection()
                            FeaturedCard()
                        }
                        OfficeCardSection()
                        FnBCardSection()
                    }
                }
            }
            .ignoresSafeArea(.all)
            
            // Search results overlay
            if isSearching {
                SearchResultsView(searchResults: filteredItems)
                    .transition(.move(edge: .top))
            }
        }
        .onChange(of: searchText) { oldValue, newValue in
            withAnimation {
                isSearching = !newValue.isEmpty
            }
        }
    }
}

#Preview {
    HomeView()
}
