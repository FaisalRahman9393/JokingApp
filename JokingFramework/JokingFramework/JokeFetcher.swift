//
//  JokeFetcher.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

class JokeFetcher {
    
    var networkClient: NetworkClientPort
    let jokesEndpoints: JokesEndpoints
    
    init(networkClient: NetworkClientPort) {
        self.networkClient = networkClient
        self.jokesEndpoints = JokesEndpoints()
    }
    
    func fetchRandomJoke() -> String {
        guard let randomJokeRequest = buildRandomJokeRequest(endpoint: jokesEndpoints.RANDOM_JOKE_ENDPOINT)
            else {
                return ""
        }
        
        networkClient.perform(randomJokeRequest) { (data, networkResponse, networkError) in
            guard let responseData = data else {
                return
            }
            
            
            if let jokeResponse = try? JSONDecoder().decode(JokeResponse.self, from: responseData) {
            
                print(jokeResponse)
            
            }
            
            
        }
      return ""
        
    }
    
    private func buildRandomJokeRequest(endpoint: String) -> URLRequest? {
        
        guard let jokesURL = URLComponents(string: endpoint)?.url else {
            return nil
        }
        
        return URLRequest(url: jokesURL)
    }

}
