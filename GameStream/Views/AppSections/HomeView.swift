//
//  HomeView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI
import Kingfisher
import AVKit

struct HomeView: View {
    @State var searchText: String = ""
    @State var resultEmpty = false
    @ObservedObject var allGames = GamesViewModel()
    @ObservedObject var foundGame = SearchGame()

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                    .padding(.bottom, 32)
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            NavigationLink(destination: SearchView(searchText: searchText)) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(searchText.isEmpty ? Color("light-gray") : Color("dark-cian"))
                            }.onTapGesture {
                                search(searchText: searchText)
                            }.disabled(searchText.isEmpty)
                            ZStack(alignment: .leading) {
                                if searchText.isEmpty {
                                    Text("Search").foregroundColor(Color("light-gray"))
                                }
                                TextField("", text: $searchText)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                    .onSubmit {
                                        search(searchText: searchText)
                                    }
                                    .submitLabel(.done)
                            }.alert(isPresented: $resultEmpty) {
                                Alert(title: Text("Error 404"), message: Text("Game not found"), dismissButton: .default(Text("Ok")))
                            }
                        }.padding([.top, .leading, .bottom], 11)
                        .background(Color("blue-gray"))
                        .clipShape(Capsule())
                        Text("Trending")
                            .textCase(.uppercase)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        ZStack {
                            NavigationLink(destination: SearchView(searchText: "The Witcher 3")) {
                                VStack(spacing: 0) {
                                    Image("The Witcher 3")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                    Text("The Witcher 3")
                                        .font(.system(size: 17, weight: .bold, design: .rounded))
                                        .padding(.leading)
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .frame(height: 50)
                                        .background(Color("blue-gray"))
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                }
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            .padding(.vertical)
                    }
                    VStack {
                        Text("Categories")
                            .textCase(.uppercase)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.bottom, 11)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Button {
                                    print("FPS")
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("blue-gray"))
                                            .frame(width: 200, height: 120)
                                        Image("FPS")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 42, height: 42)
                                            .padding(.bottom, 35)
                                        Text("FPS")
                                            .padding(.top, 55)
                                            .foregroundColor(Color("cian"))
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                    }
                                }
                                Button {
                                    print("RPG")
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("blue-gray"))
                                            .frame(width: 200, height: 120)
                                        Image("RPG")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 42, height: 42)
                                            .padding(.bottom, 35)
                                        Text("RPG")
                                            .padding(.top, 55)
                                            .foregroundColor(Color("cian"))
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                    }
                                }
                                Button {
                                    print("OpenWorld")
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("blue-gray"))
                                            .frame(width: 200, height: 120)
                                        Image("OpenWorld")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 42, height: 42)
                                            .padding(.bottom, 35)
                                        Text("OpenWorld")
                                            .padding(.top, 55)
                                            .foregroundColor(Color("cian"))
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                    }
                                }
                            }
                        }
                    }
                    VStack {
                        Text("Recommended")
                            .textCase(.uppercase)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.bottom, 11)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(allGames.gamesInformation.shuffled(), id: \.self) {
                                    game in
                                    NavigationLink(destination: GameDetailView(title: game.title, studio: game.studio, contentRaiting: game.contentRaiting, publicationYear: game.publicationYear, description: game.description, platforms: game.platforms, tags: game.tags, videoUrl: game.videosUrls.mobile, galleryImages: game.galleryImages)) {
                                        KFImage(URL(string: game.galleryImages[0])!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 240, height: 135)
                                            .clipShape(RoundedRectangle(cornerRadius: 3))
                                    }
                                }
                            }
                        }
                    }
                    VStack {
                        Text("Games you might like")
                            .textCase(.uppercase)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.bottom, 11)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(allGames.gamesInformation.shuffled(), id: \.self) {
                                    game in
                                    NavigationLink(destination: GameDetailView(title: game.title, studio: game.studio, contentRaiting: game.contentRaiting, publicationYear: game.publicationYear, description: game.description, platforms: game.platforms, tags: game.tags, videoUrl: game.videosUrls.mobile, galleryImages: game.galleryImages)) {
                                        KFImage(URL(string: game.galleryImages[2])!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 240, height: 135)
                                            .clipShape(RoundedRectangle(cornerRadius: 3))
                                    }
                                }
                            }
                            .padding(.bottom, 18)
                        }
                    }
                }
                Spacer()
            }.padding(.horizontal, 10)
        }
    }
    
    func search(searchText: String) {
        foundGame.search(gameName: searchText)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print(foundGame.gamesInformation.count)
            if foundGame.gamesInformation.count == 0 {
                resultEmpty = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
