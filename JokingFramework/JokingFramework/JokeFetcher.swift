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
    
    func fetchRandomJoke(success: @escaping (Joke) -> Void, failure: @escaping (JokeFetchingError) -> Void) {
        guard let randomJokeRequest = buildRandomJokeRequest(endpoint: jokesEndpoints.RANDOM_JOKE_ENDPOINT)
            else {
                failure(JokeFetchingError(reason: .Unknown, message: "Invalid URL"))
                return
        }
        
        networkClient.perform(randomJokeRequest) { (data, networkResponse, networkError) in
            guard let responseData = data else { return }
            
            if let jokeResponse = try? JSONDecoder().decode(JokeResponse.self, from: responseData) {
                      success(Joke(jokeID: jokeResponse.value.id, joke: jokeResponse.value.joke, jokeCategory: jokeResponse.value.categories))
            } else {
                failure(JokeFetchingError(reason: .MissingKeysOrInvalidJson, message: "Missing Keys or Invalid Json"))
            }
        }
        
    }
    
    private func buildRandomJokeRequest(endpoint: String) -> URLRequest? {
        
        guard let jokesURL = URLComponents(string: endpoint)?.url else {
            return nil
        }
        
        return URLRequest(url: jokesURL)
    }

}

struct JokeFetchingError {
    var reason: JokeFetchinngFailureReason
    var message: String
    
    init(reason: JokeFetchinngFailureReason, message: String) {
        self.reason = reason
        self.message = message
    }
}

enum JokeFetchinngFailureReason {
    case EndpointUnreachable
    case MissingKeysOrInvalidJson
    case Unknown
}

