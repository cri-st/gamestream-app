//
//  GamesView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var allGames = GamesViewModel()
    let gridForm = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Text("Games")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                ScrollView {
                    LazyVGrid(columns: gridForm, spacing: 8) {
                        ForEach(allGames.gamesInformation, id: \.self) {
                            game in
                            NavigationLink(destination: GameDetailView(title: game.title, studio: game.studio, contentRaiting: game.contentRaiting, publicationYear: game.publicationYear, description: game.description, platforms: game.platforms, tags: game.tags, videoUrl: game.videosUrls.mobile, galleryImages: game.galleryImages)) {
                                AsyncImage(url: URL(string: game.galleryImages[0])!) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                        .padding(.bottom, 12)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
            }.padding(.horizontal, 5)
        }
    }
}

struct Games_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
