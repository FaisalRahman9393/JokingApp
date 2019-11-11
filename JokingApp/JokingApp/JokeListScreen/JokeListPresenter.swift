//
//  JokeListPresenter.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

class JokeListPresenter: JokeListViewDelegate {
    
    let jokesListViewController: JokeListViewController
    let jokesAdapter: JokesToolkitAdapter
    
    init(_ jokesListViewController: JokeListViewController, _ jokesAdapter: JokesToolkitAdapter) {
        self.jokesListViewController = jokesListViewController
        self.jokesAdapter = jokesAdapter
    }
    
}
