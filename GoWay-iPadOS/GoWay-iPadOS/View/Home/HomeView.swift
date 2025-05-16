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
                VStack(spacing: 0) {
                    Header(searchText: $searchText, isSearching: $isSearching)
                    
                    if !isSearching {
                        VStack(alignment: .leading, spacing: 32) {
                            // Facility and Featured section
                            HStack(alignment: .top, spacing: 24) {
                                FacilityCardSection()
                                FeaturedCard()
                            }
                            
                            // Office section
                            OfficeCardSection()
                            
                            // F&B section
                            FnBCardSection()
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 24)
                    }
                }
            }
            .ignoresSafeArea(.all)
            
            // Search results overlay
            if isSearching {
                Header(searchText: $searchText, isSearching: $isSearching)
                
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
