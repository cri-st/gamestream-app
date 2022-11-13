//
//  GamesViewModel.swift
//  GameStream
//
//  Created by Crist on 09/11/2022.
//

import Foundation

class GamesViewModel: ObservableObject {
    @Published var gamesInformation = [Game]()

    init() {
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    let decodeData = try
                        JSONDecoder().decode([Game].self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gamesInformation.append(contentsOf: decodeData)
                    }
                }
            } catch {
                print("The error is: \(error)")
            }
        }.resume()
    }
}
