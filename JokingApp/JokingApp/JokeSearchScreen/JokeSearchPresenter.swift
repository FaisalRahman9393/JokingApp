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
    let jokesAdapter: JokesToolkitPort
    
    init(_ jokesSearchViewController: JokeSearchViewController, _ jokesAdapter: JokesToolkitPort) {
        self.jokesSearchViewController = jokesSearchViewController
        self.jokesAdapter = jokesAdapter
    }
    
    
    func jokeSearchPressed(name: String) {
        
        var components = name.components(separatedBy:" ")
        if((components.count > 0)) {
            let firstName = components.removeFirst()
            let lastName = components.joined(separator: " ")
            
            jokesAdapter.getACustomJoke(firstName: firstName, lastName: lastName, success: { (jokeRetrived) in
                self.jokesSearchViewController.updateTextLabel(message: jokeRetrived.joke)
            }) { (_) in
                self.jokesSearchViewController.presentMessage(messageToShow: "Couldn't connect to the server", title: "Someone did an oopsie!")
            }
            
        } else {
            
        }
    }
    
    
}
