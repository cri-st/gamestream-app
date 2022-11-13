//
//  GameDetailView.swift
//  GameStream
//
//  Created by Crist on 09/11/2022.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameDetailView: View {
    let title:String
    let studio:String
    let contentRaiting:String
    let publicationYear:String
    let description:String
    let platforms:[String]
    let tags:[String]
    let videoUrl:String
    let galleryImages:[String]

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Video(url: videoUrl).frame(height: 300)
                ScrollView {
                    Detail(title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, tags: tags).padding(.bottom)
                    Gallery(galleryImages: galleryImages)
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct Video:View {
    let url: String
    var body: some View {
        let player = AVPlayer(url: URL(string: url)!)
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear(perform: {
                player.play()
            })
            .onDisappear(perform: {
                player.pause()
            })
    }
}

struct Detail:View {
    let title:String
    let studio:String
    let contentRaiting:String
    let publicationYear:String
    let description:String
    let tags:[String]
    
    var body: some View{
        VStack(alignment:.leading) {
            Text("\(title)")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding(.leading)
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                Text("\(contentRaiting)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                Text("\(publicationYear)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            Text("\(description)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
                .padding(.trailing)
            HStack{
                ForEach(tags, id:\.self) {
                    tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top,4)
                        .padding(.leading)
                }
            }
        }.frame( maxWidth: .infinity,  alignment: .leading)
    }
}

struct Gallery:View {
    let galleryImages:[String]
    let gridForm = [GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .textCase(.uppercase)
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
                .padding(.bottom, 11)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridForm, spacing: 8) {
                    ForEach(galleryImages, id: \.self) {
                        imageUrl in
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .padding(.bottom, 12)
                    }
                }
            }.frame(height: 180)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(title: "Sonic The Hedgehog", studio: "Sega", contentRaiting: "E+", publicationYear: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", platforms: ["Sega Genesis"], tags: ["plataformas","mascota"], videoUrl: "example", galleryImages: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
