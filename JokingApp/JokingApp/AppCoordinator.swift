//
//  AppCoordinator.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit


class AppCoordinator {
    var rootViewController: UIViewController {
        return homeViewController
    }
    
    
    let jokeSearchViewController: JokeSearchViewController
    let jokeSearchPresenter: JokeSearchPresenter
    
    let jokeListViewController: JokeListViewController
    let jokeListPresenter: JokeListPresenter
    
    let homeViewController: HomeViewController
    let homePresenter: HomePresenter
    
    let jokesToolkitAdapter: JokesToolkitAdapter

    init() {
        let storyboard = UIStoryboard(name: "JokingAppStoryboard", bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        

        jokeSearchViewController = storyboard.instantiateViewController(withIdentifier: "JokeSearch") as! JokeSearchViewController
        let jokeSearchNavigationController = UINavigationController(rootViewController: jokeSearchViewController)
        
        jokeListViewController = storyboard.instantiateViewController(withIdentifier: "JokeList") as! JokeListViewController
        let jokeListNavigationController = UINavigationController(rootViewController: jokeListViewController)
        
        jokesToolkitAdapter = JokesToolkitAdapter()
//        jokesToolkitAdapter.getVersionNumber()
        
        homePresenter = HomePresenter(homeViewController, jokesToolkitAdapter)
        jokeSearchPresenter = JokeSearchPresenter(jokeSearchViewController, jokesToolkitAdapter)
        jokeListPresenter = JokeListPresenter(jokeListViewController, jokesToolkitAdapter)

    }
    
    func start() {
        homeViewController.delegate = homePresenter
        jokeSearchViewController.delegate = jokeSearchPresenter
        jokeListViewController.delegate = jokeListPresenter
    }
    
}
