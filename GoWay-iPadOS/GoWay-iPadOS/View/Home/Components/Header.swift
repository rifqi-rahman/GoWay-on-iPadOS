//
//  Header.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 11/05/25.
//

import SwiftUI

struct Header: View {
    @State private var searchText: String = ""
    
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
                    SearchBar(searchText: $searchText)
                    Spacer()
                }
            }
            .padding(.vertical, 1)
        
//        Spacer()
    }
}

#Preview {
    Header()
}
