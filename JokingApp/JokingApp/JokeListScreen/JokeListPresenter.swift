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
    let jokesAdapter: JokesToolkitAdapter
    
    init(_ jokesListViewController: JokeListViewController, _ jokesAdapter: JokesToolkitAdapter) {
        self.jokesListViewController = jokesListViewController
        self.jokesAdapter = jokesAdapter
    }
    
    func viewDidLoad() {
//        fetchJokeBatch()
    }
    
    func fetchJokeBatch(success: @escaping ([Joke]) -> Void,
                        failure: @escaping () -> Void)  {
        self.jokesAdapter.getABatchOfFiveRandomJokes(success: { jokeRetrived in
            success(jokeRetrived)
        }) { (blah) in
            print(blah)
            
        }
    }
    
    func clearTable() {
        self.jokesListViewController.items.removeAll()
    }
    


    
}
