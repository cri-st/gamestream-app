//
//  SearchView.swift
//  GameStream
//
//  Created by Crist on 11/11/2022.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @ObservedObject var searchGames = SearchGame()
    @State var searchedText: String
    let gridForm = [
        GridItem(.flexible())
    ]

    init(searchText: String) {
        searchedText = searchText
        searchGames.search(gameName: searchText)
    }

    var body: some View {
        ZStack {
            if (searchGames.gamesInformation.count == 1) {
                let game = searchGames.gamesInformation[0]
                GameDetailView(title: game.title, studio: game.studio, contentRaiting: game.contentRaiting, publicationYear: game.publicationYear, description: game.description, platforms: game.platforms, tags: game.tags, videoUrl: game.videosUrls.mobile, galleryImages: game.galleryImages)
            } else {
                Color("marine").ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text("Search result")
                            .textCase(.uppercase)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 11, trailing: 0))
                        if (searchGames.gamesInformation.count == 0) {
                            Text("Game not found for : '\(searchedText)'")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 16, leading: 0, bottom: 11, trailing: 0))
                        } else {
                            LazyVGrid(columns: gridForm, spacing: 8) {
                                ForEach(searchGames.gamesInformation, id: \.self) {
                                    game in
                                    NavigationLink(destination: GameDetailView(title: game.title, studio: game.studio, contentRaiting: game.contentRaiting, publicationYear: game.publicationYear, description: game.description, platforms: game.platforms, tags: game.tags, videoUrl: game.videosUrls.mobile, galleryImages: game.galleryImages)) {
                                        KFImage(URL(string: game.galleryImages[0])!)
                                            .resizable()
                                            .frame(width: 240, height: 120)
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 4))
                                            .padding(.bottom, 12)
                                        Spacer()
                                        Text(game.title).font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(.white)
                                        Spacer()
                                    }.simultaneousGesture(TapGesture())
                                }
                            }
                        }
                    }.frame(alignment: .leading)
                }.padding(.horizontal, 6)
            }
        }
//        .toolbar(.hidden, for: .tabBar)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: "")
    }
}
