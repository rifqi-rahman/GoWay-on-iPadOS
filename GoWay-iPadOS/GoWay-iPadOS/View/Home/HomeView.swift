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
        NavigationStack {
            ZStack(alignment: .top) {
                // Main content
                if !isSearching {
                    ScrollView {
                        VStack(spacing: 0) {
                            Header(searchText: $searchText, isSearching: $isSearching)
                            
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
                        }
                    }
                } else {
                    // Search view
                    VStack(spacing: 0) {
                        SearchBar(searchText: $searchText, isSearching: $isSearching)
                        
                        ScrollView {
                            SearchResultsView(searchResults: filteredItems)
                        }
                    }
                    .background(Color(UIColor.systemBackground))
                }
            }
            .navigationDestination(for: SearchableItem.self) { item in
                NavigationView(item: item)
            }
        }
        .onChange(of: searchText) { oldValue, newValue in
            isSearching = !newValue.isEmpty
        }
    }
}

#Preview {
    HomeView()
}
