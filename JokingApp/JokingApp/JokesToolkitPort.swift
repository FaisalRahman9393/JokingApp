//
//  JokesToolkitPort.swift
//  JokingApp
//
//  Created by Faisal Rahman on 13/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation
import JokingFramework

protocol JokesToolkitPort {
    
    func getACustomJoke(firstName: String,
                        lastName: String,
                        success: @escaping (Joke) -> Void,
                        failure: @escaping (JokeFetchingError) -> Void)
    
    func getARandomJoke(success: @escaping (Joke) -> Void,
                        failure: @escaping (JokeFetchingError) -> Void)
    
    func getABatchOfSevenRandomJokes(success: @escaping ([Joke]) -> Void,
                                     failure: @escaping (JokeFetchingError) -> Void)
}
