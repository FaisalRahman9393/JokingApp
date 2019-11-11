//
//  HomePresenter.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

class HomePresenter: HomeViewDelegate {
    
    let homeViewController: HomeViewController
    let jokesAdapter: JokesToolkitAdapter
    
    init(_ homeViewController: HomeViewController, _ jokesAdapter: JokesToolkitAdapter) {
        self.homeViewController = homeViewController
        self.jokesAdapter = jokesAdapter
    }
}
