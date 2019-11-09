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
        let endpoint = String(format: jokesEndpoints.BATCH_RANDOM_JOKES_ENDPOINT, String(1))
        guard let randomJokeRequest = buildRandomJokeRequest(endpoint: endpoint)
            else {
                failure(JokeFetchingError(reason: .Unknown, message: "Invalid URL"))
                return
        }
        
        networkClient.perform(randomJokeRequest) { (data, networkResponse, networkError) in
            guard let responseData = data else { return }
            
            if let jokeResponse = try? JSONDecoder().decode(JokeResponse.self, from: responseData) {
                
                var jokesBatch = [Joke]()
                
                for joke in jokeResponse.value {
                    jokesBatch.append(Joke(jokeID: joke.id,
                                           joke: joke.joke,
                                           jokeCategory: joke.categories))
                }
                
                success(jokesBatch[0])
                
            } else {
                failure(JokeFetchingError(reason: .MissingKeysOrInvalidJson, message: "Missing Keys or Invalid Json"))
            }
        }
        
    }
    
    func batchFetchRandomJokes(numberOfJokes: Int, success: @escaping ([Joke]) -> Void, failure: @escaping (JokeFetchingError) -> Void) {
        let endpoint = String(format: jokesEndpoints.BATCH_RANDOM_JOKES_ENDPOINT, String(numberOfJokes))
        guard let randomJokeRequest = buildRandomJokeRequest(endpoint: endpoint)
            else {
                failure(JokeFetchingError(reason: .Unknown, message: "Invalid URL"))
                return
        }
        
        networkClient.perform(randomJokeRequest) { (data, networkResponse, networkError) in
            guard let responseData = data else { return }
            
            if let jokesResponse = try? JSONDecoder().decode(JokeResponse.self, from: responseData) {
                
                var jokesBatch = [Joke]()
                
                for joke in jokesResponse.value {
                    jokesBatch.append(Joke(jokeID: joke.id,
                                           joke: joke.joke,
                                           jokeCategory: joke.categories))
                }
                
                success(jokesBatch)
                
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

