//
//  AppTabView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct AppTabView: View {
    @ObservedObject var login: LoginViewModel
    var maxWidth: CGFloat! = 450
    
    @State var selectedTab:Int = 2

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            TabView(selection: $selectedTab) {
                Group {
                    ProfileView(login: self.login).tabItem {
                        Image("ProfileIcon")
                            .renderingMode(.template)
                            .resizable()
                        Text("Profile")
                    }.tag(0)
                    GamesView().tabItem {
                        Image("GamesIcon")
                            .renderingMode(.template)
                            .resizable()
                        Text("Games")
                    }.tag(1)
                    HomeView().tabItem {
                        Image("HomeIcon")
                            .renderingMode(.template)
                            .resizable()
                        Text("Home")
                    }
                    .padding(.bottom, -8)
                    .tag(2)
                    FavoritesView().tabItem {
                        Image("HeartIcon")
                            .renderingMode(.template)
                            .resizable()
                        Text("Favorites")
                    }
                    .padding(.bottom, -8)
                    .tag(3)
                }
            }
            .accentColor(Color.white)
            .navigationBarBackButtonHidden(true)
            .preferredColorScheme(.dark)
        }
    }
    
    init(login: LoginViewModel) {
        self.login = login
        UITabBar.appearance().backgroundColor = UIColor(Color("tab-bar"))
        UITabBar.appearance().barTintColor = UIColor(Color("tab-bar"))
        UITabBar.appearance().isTranslucent = true
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(login: LoginViewModel(signedIn: false))
    }
}
