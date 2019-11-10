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
    
    let randomJokeViewController: RandomJokeViewController
    let randomJokePresenter: RandomJokePresenter
    
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
        
        randomJokeViewController = storyboard.instantiateViewController(withIdentifier: "RandomJoke") as! RandomJokeViewController
        let randomJokeNavigationController = UINavigationController(rootViewController: randomJokeViewController)
        
        jokeSearchViewController = storyboard.instantiateViewController(withIdentifier: "JokeSearch") as! JokeSearchViewController
        let jokeSearchNavigationController = UINavigationController(rootViewController: randomJokeViewController)
        
        jokeListViewController = storyboard.instantiateViewController(withIdentifier: "JokeList") as! JokeListViewController
        let jokeListNavigationController = UINavigationController(rootViewController: jokeListViewController)
        
        jokesToolkitAdapter = JokesToolkitAdapter()
        
        homePresenter = HomePresenter(homeViewController, jokesToolkitAdapter)
        randomJokePresenter = RandomJokePresenter(randomJokeViewController, jokesToolkitAdapter)
        jokeSearchPresenter = JokeSearchPresenter(jokeSearchViewController, jokesToolkitAdapter)
        jokeListPresenter = JokeListPresenter(jokeListViewController, jokesToolkitAdapter)

    }
    
    func start() {
        homeViewController.delegate = homePresenter
        randomJokeViewController.delegate = randomJokePresenter
        jokeSearchViewController.delegate = jokeSearchPresenter
        jokeListViewController.delegate = jokeListPresenter
    }
    
}
