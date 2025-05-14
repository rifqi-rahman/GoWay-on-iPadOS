//
//  ContentView.swift
//  GoWay-iPadOS
//
//  Created by Rifqi Rahman on 10/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
       
            ZStack {
//                Color.white
//                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack { // HERO BANNER
                        Header()
                        HStack (alignment: .top){
                            FacilityCardSection()
                            FeaturedCard()
                        }
                        OfficeCardSection()
                        FnBCardSection()
                        
                    }
                }
            }.ignoresSafeArea(.all)
        
        .padding()
    }
}

#Preview {
    HomeView()
}
