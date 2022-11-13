//
//  HomeView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct HomeView: View {
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
                    SubModuloHome()
                }
                Spacer()
            }.padding(.horizontal, 10)
        }
    }
}

struct SubModuloHome: View {

    @State var searchText: String = ""
    @State var resultEmpty = false
    @ObservedObject var foundGame = SearchGame()

    var body: some View {
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
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            ZStack {
                NavigationLink(destination: SearchView(searchText: "The Witcher 3")) {
                    VStack(spacing: 0) {
                        Image("thewitcher").resizable().scaledToFit()
                        Text("The Witcher 3").padding(.leading)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .background(Color("blue-gray"))
                    }
                }
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)

            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
        }
        VStack {
            Text("Categories")
                .textCase(.uppercase)
                .font(.title3)
                .foregroundColor(.white)
                .bold()
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
                                .font(.title3)
                                .foregroundColor(Color("cian"))
                                .bold()
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
                                .font(.title3)
                                .foregroundColor(Color("cian"))
                                .bold()
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
                                .font(.title3)
                                .foregroundColor(Color("cian"))
                                .bold()
                        }
                    }
                }
            }
        }
        VStack {
            Text("Recommended")
                .textCase(.uppercase)
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.bottom, 11)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    NavigationLink(destination: SearchView(searchText: "Abzu")) {
                        Image("image 19")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                    NavigationLink(destination: SearchView(searchText: "Crash")) {
                        Image("image 20")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                    NavigationLink(destination: SearchView(searchText: "Stranding")) {
                        Image("image 21")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                }
            }
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
