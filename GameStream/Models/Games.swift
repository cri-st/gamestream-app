//
//  Games.swift
//  GameStream
//
//  Created by Crist on 09/11/2022.
//

import Foundation

struct GamesResults:Codable {
    let results:[Game]
}

struct Game:Codable, Hashable {
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:VideoUrl
    var galleryImages:[String]
}

struct VideoUrl:Codable, Hashable {
    var mobile:String
    var tablet:String
}
