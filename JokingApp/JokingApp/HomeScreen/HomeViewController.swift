//
//  HomeViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    
    //TODO
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewDelegate?
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
    
    @IBAction func randomJokeButtonPressed(_ sender: Any) {
        print("hello")
    }
    
    @IBAction func searchForJokeButtonPressed(_ sender: Any) {
        print("hello")
    }
    
    @IBAction func listOfJokesButtonPressed(_ sender: Any) {
        print("hello")
    }
}
