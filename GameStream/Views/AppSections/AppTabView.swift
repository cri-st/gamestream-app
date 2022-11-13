//
//  AppTabView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct AppTabView: View {
    
    @State var selectedTab:Int = 2

    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                ProfileView().tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(0)
                GamesView().tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
                HomeView().tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
                FavoritesView().tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(3)
            }.toolbarBackground(.visible,
                                for: .tabBar)
            .toolbarBackground(Color("tab-bar"),
                               for: .tabBar)
        }.accentColor(Color.white)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
