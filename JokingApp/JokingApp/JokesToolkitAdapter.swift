//
//  JokesToolkitAdapter.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation
import JokingFramework

class JokesToolkitAdapter {
    
    var jokesToolkit = JokesToolkit()

    
    init() {
        jokesToolkit.initialise()
    }
    
    func getARandomJoke(success: @escaping (Joke) -> Void,
                        failure: @escaping (JokeFetchingError) -> Void) {
        
        jokesToolkit.fetchRandomJoke(success: { jokeRetrived in
            success(jokeRetrived)
        }) { (jokeFetchingError) in
            failure(jokeFetchingError)
        }
    }
    
    func getACustomJoke(firstName: String,
                        lastName: String,
                        success: @escaping (Joke) -> Void,
                        failure: @escaping (JokeFetchingError) -> Void) {
        
        jokesToolkit.fetchCustomJoke(firstName: firstName,
                                     lastName: lastName,
                                     success: {
                                        jokeRetrived in
            success(jokeRetrived)
        }) { jokeFetchingError in
            failure(jokeFetchingError)
        }
    }
    
    func getABatchOfTenRandomJokes(success: @escaping ([Joke]) -> Void,
                                   failure: @escaping (JokeFetchingError) -> Void) {
        
        jokesToolkit.batchFetchRandomJokes(numberOfJokes: 10,
                                           success: {
                                            jokeRetrived in
            success(jokeRetrived)
        }) { jokeFetchingError in
            failure(jokeFetchingError)
        }
        
    }

}
