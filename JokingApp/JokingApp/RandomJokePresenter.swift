//
//  RandomJokePresenter.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

class RandomJokePresenter: RandomJokeViewDelegate {
    
    let randomJokeViewController: RandomJokeViewController
    let jokesAdapter: JokesToolkitAdapter
    
    init(_ randomJokeViewController: RandomJokeViewController, _ jokesAdapter: JokesToolkitAdapter) {
        self.randomJokeViewController = randomJokeViewController
        self.jokesAdapter = jokesAdapter
    }
    
}
