//
//  JokesToolkit.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

class JokesToolkit {
    
    var networkClient: NetworkClientPort!
    var jokesEndpoints: JokesEndpoints!
    var jokeFetcher: JokeFetcher!
    
    
    public func initialise(){
        let networkClient = NetworkClient()
        
        initialise(networkClient: networkClient)
    }
    
    func initialise(networkClient: NetworkClientPort)   {
        self.networkClient = networkClient
        self.jokesEndpoints = JokesEndpoints()
        self.jokeFetcher = JokeFetcher(networkClient: networkClient)
    }
    
    func fetchRandomJoke(success: @escaping (Joke) -> Void, failure: @escaping (JokeFetchingError) -> Void) {
        return jokeFetcher.fetchRandomJoke(success: success, failure: failure)
    }
}


