//
//  FavoritesView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI
import Kingfisher
import AVKit

struct FavoritesView: View {
    @ObservedObject var allGames = GamesViewModel()

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Text("Favorites")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                ScrollView {
                    ForEach(allGames.gamesInformation, id: \.self) { game in
                        VStack(spacing: 0) {
                            ZStack {
                                VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!)).frame(height: 216)
                                    .clipShape(RoundedRectangle(cornerRadius: 3))
                                NavigationLink(destination: SearchView(searchText: game.title)) {
                                    KFImage(URL(string: game.galleryImages[0])!)
                                        .resizable()
                                        .scaledToFit()
                                }
                                .hidden()
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 42, height: 42)
                                    .hidden()
                            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            Text(game.title)
                                .font(.title3)
                                .bold()
                                .padding(.leading)
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .frame(height: 50)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                                .padding(.bottom, 8)
                        }
                    }
                }.padding(.bottom, 8)
            }.padding(.horizontal, 5)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
