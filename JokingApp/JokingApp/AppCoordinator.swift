//
//  AppCoordinator.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit


class AppCoordinator: SegueDelegate {

    var rootViewController: UIViewController {
        return homeViewController
    }
    
    var getNavigationController: UINavigationController {
        return navViewController
    }
    
    let jokeSearchViewController: JokeSearchViewController
    let jokeSearchPresenter: JokeSearchPresenter
    
    let jokeListViewController: JokeListViewController
    let jokeListPresenter: JokeListPresenter
    
    let homeViewController: HomeViewController
    let homePresenter: HomePresenter
    
    let jokesToolkitAdapter: JokesToolkitAdapter
    
    let navViewController: UINavigationController

    init() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        
        jokeSearchViewController = storyboard.instantiateViewController(withIdentifier: "JokeSearch") as! JokeSearchViewController
        
        jokeListViewController = storyboard.instantiateViewController(withIdentifier: "JokeList") as! JokeListViewController

        navViewController = storyboard.instantiateViewController(withIdentifier: "NavController") as! UINavigationController
        
        jokesToolkitAdapter = JokesToolkitAdapter()
        
        homePresenter = HomePresenter(homeViewController, jokesToolkitAdapter)
        jokeSearchPresenter = JokeSearchPresenter(jokeSearchViewController, jokesToolkitAdapter)
        jokeListPresenter = JokeListPresenter(jokeListViewController, jokesToolkitAdapter)

    }
    
    func start() {
        homeViewController.segueDelegate = self
        homeViewController.delegate = homePresenter
        jokeSearchViewController.delegate = jokeSearchPresenter
        jokeListViewController.delegate = jokeListPresenter
        
        getNavigationController.setViewControllers([rootViewController], animated: true)
    }
    
    func searchButtonPressed() {
        navViewController.pushViewController(jokeSearchViewController, animated: true)
    }
    
    func listButtonPressed() {
        navViewController.pushViewController(jokeListViewController, animated: true)
    }
    
}
