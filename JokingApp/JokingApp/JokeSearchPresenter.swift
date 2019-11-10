//
//  JokeSearchPresenter.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

class JokeSearchPresenter: JokeSearchViewDelegate {
    
    let jokesSearchViewController: JokeSearchViewController
    let jokesAdapter: JokesToolkitAdapter
    
    init(_ jokesSearchViewController: JokeSearchViewController, _ jokesAdapter: JokesToolkitAdapter) {
        self.jokesSearchViewController = jokesSearchViewController
        self.jokesAdapter = jokesAdapter
    }
    
    
}
