//
//  Home.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Text("Profile").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            Text("Games").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Games")
            }
            Text("Home").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            Text("Favorites").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
