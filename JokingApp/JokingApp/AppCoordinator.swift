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
        return tabBarController
    }
    
    let userTableViewController: UserTableViewController
    let userUpdater: UserUpdater
    
    let requestsViewController: RequestsViewController
    let requestPerformer: RequestPerformer
    
    let utilityViewController: UtilityViewController
    let settingsManager: SettingsManager
    
    let customUIViewController: CustomUIViewController
    
    let tabBarController: UITabBarController
    
    let authAdapter: AuthAdapter

    
    init() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        userTableViewController = storyboard.instantiateViewController(withIdentifier: "UserTable") as! UserTableViewController
        let userNavigationController = UINavigationController(rootViewController: userTableViewController)
        
        requestsViewController = storyboard.instantiateViewController(withIdentifier: "Requests") as! RequestsViewController
        let requestsNavigationController = UINavigationController(rootViewController: requestsViewController)
        
        utilityViewController = storyboard.instantiateViewController(withIdentifier: "Utility") as! UtilityViewController
        let utilityNavigationController = UINavigationController(rootViewController: utilityViewController)
        
        customUIViewController = storyboard.instantiateViewController(withIdentifier: "CustomUI") as! CustomUIViewController
        let customUINavigationController = UINavigationController(rootViewController: customUIViewController)
        
        tabBarController = UITabBarController()
        tabBarController.viewControllers = [userNavigationController, requestsNavigationController, utilityNavigationController, customUINavigationController]
    
        
        let delegate = AppPresentationDelegate(tabBarController)
        
        authAdapter = AuthAdapter(config, delegate, AppCoordinator.customAuthFont)
        
        userUpdater = UserUpdater(userTableViewController, authAdapter)
        requestPerformer = RequestPerformer(authAdapter.echoClient, authAdapter.authenticatedClient, requestsViewController, authAdapter)
        settingsManager = SettingsManager(utilityViewController, authAdapter)
    }
    
    func start() {
        userTableViewController.delegate = userUpdater
        requestsViewController.delegate = requestPerformer
        utilityViewController.delegate = settingsManager
        
        authAdapter.addAuthListener(authListener)
        
        let flagpoleLabel = AuthToolkit.lastKnownFlagpoleState == FlagpoleState.GREEN ? "GREEN" : "RED"
        userTableViewController.displayMessage("Last known flagpole: \(flagpoleLabel)")
    }
    
}
