//
//  JokeListPresenter.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation
import JokingFramework

class JokeListPresenter: JokeListViewDelegate {

    let jokesListViewController: JokeListViewController
    let jokesAdapter: JokesToolkitPort
    
    init(_ jokesListViewController: JokeListViewController, _ jokesAdapter: JokesToolkitPort) {
        self.jokesListViewController = jokesListViewController
        self.jokesAdapter = jokesAdapter
    }
    
    func viewDidLoad() {
        jokesListViewController.updateTableWithNewJokes()
    }
    
    func fetchJokeBatch(success: @escaping ([Joke]) -> Void)  {
        self.jokesAdapter.getABatchOfSevenRandomJokes(success: { jokeRetrived in
            success(jokeRetrived)
        }) { (_) in
         self.jokesListViewController.presentMessage(messageToShow: "Couldn't connect to the server", title: "Someone did an oopsie!")
        }
    }
    
    
}
