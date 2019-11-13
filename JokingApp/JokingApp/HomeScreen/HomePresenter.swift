//
//  HomePresenter.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation
import JokingFramework

class HomePresenter: HomeViewDelegate {

    let homeViewController: HomeViewController
    let jokesAdapter: JokesToolkitAdapter
    
    init(_ homeViewController: HomeViewController, _ jokesAdapter: JokesToolkitAdapter) {
        self.homeViewController = homeViewController
        self.jokesAdapter = jokesAdapter
    }
    
    func randomJokeButtonPressed() {
        jokesAdapter.getARandomJoke(success: { (joke) in
            let messageToDisplay = joke.joke
            self.homeViewController.presentOkDialog(title: "Heres a random joke!", messageToShow: messageToDisplay)
        }) { (_) in
            
        }
    }
}
