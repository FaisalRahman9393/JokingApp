//
//  JokesToolkit.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

public class JokesToolkit {
    
    private var networkClient: NetworkClientPort!
    private var jokesEndpoints: JokesEndpoints!
    private var jokeFetcher: JokeFetcher!
    

    public init() {}
    
    public func initialise(){
        let networkClient = NetworkClient()
        
        initialise(networkClient: networkClient)
    }
    
     func initialise(networkClient: NetworkClientPort)   {
        self.networkClient = networkClient
        self.jokesEndpoints = JokesEndpoints()
        self.jokeFetcher = JokeFetcher(networkClient: networkClient)
    }
    
    public func fetchRandomJoke(success: @escaping (Joke) -> Void,
                         failure: @escaping (JokeFetchingError) -> Void) {
        
        return jokeFetcher.fetchRandomJoke(success: success, failure: failure)
    }
    
    public func batchFetchRandomJokes(numberOfJokes: Int,
                               success: @escaping ([Joke]) -> Void,
                               failure: @escaping (JokeFetchingError) -> Void) {
        
        return jokeFetcher.batchFetchRandomJokes(
            numberOfJokes: numberOfJokes,
            success: success,
            failure: failure)
    }
    
    public func fetchCustomJoke(firstName: String, lastName: String, success: @escaping (Joke) -> Void,
                               failure: @escaping (JokeFetchingError) -> Void) {
        
        return jokeFetcher.fetchCustomJoke(firstName: firstName, lastName: lastName, success: success, failure: failure)
    }
}


