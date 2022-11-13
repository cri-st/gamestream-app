//
//  SearchGame.swift
//  GameStream
//
//  Created by Crist on 10/11/2022.
//

import Foundation

class SearchGame: ObservableObject {
    @Published var gamesInformation = [Game]()

    func search(gameName:String) {
        gamesInformation.removeAll()

        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    let decodeData = try
                    JSONDecoder().decode(GamesResults.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gamesInformation.append(contentsOf: decodeData.results)
                    }
                }
            } catch {
                print("The error is: \(error)")
            }
        }.resume()
    }
}
