//
//  AppTabView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            GamesView().tabItem {
                Image(systemName: "gamecontroller")
                Text("Games")
            }
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            FavoritesView().tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
