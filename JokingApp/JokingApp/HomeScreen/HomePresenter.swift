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
    let jokesAdapter: JokesToolkitPort
    
    init(_ homeViewController: HomeViewController, _ jokesAdapter: JokesToolkitPort) {
        self.homeViewController = homeViewController
        self.jokesAdapter = jokesAdapter
    }
    
    func randomJokeButtonPressed() {
        jokesAdapter.getARandomJoke(success: { (joke) in
            let messageToDisplay = joke.joke
            self.homeViewController.presentMessage(messageToShow: "Heres a random joke!", title: messageToDisplay)
        }) { (_) in
                self.homeViewController.presentMessage(messageToShow: "Couldn't connect to the server", title: "Someone did an oopsie!")
        }
    }
}
