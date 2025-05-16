//
//  Header.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct Header: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
            ZStack { //SEARCHBAR
                VStack {
                    Image("Hero Banner")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea(edges: .all)
                        .padding(.vertical, 0)
                    
                    Spacer()
                }
                
                VStack {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                    Spacer()
                }
            }
            .padding(.vertical, 1)
    }
}

#Preview {
    Header(searchText: .constant(""), isSearching: .constant(false))
}
