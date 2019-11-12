//
//  HomeViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit
import JokingFramework

protocol HomeViewDelegate: AnyObject {
    
    //TODO
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewDelegate?
    var jokesAdapter = JokesToolkitAdapter()
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
    
    @IBAction func randomJokeButtonPressed(_ sender: Any) {
        
        jokesAdapter.getARandomJoke(success: { (joke) in
            let messageToDisplay = joke.joke
            
            let alertController = UIAlertController(title: "Heres a random joke!", message: messageToDisplay, preferredStyle: .alert)
            
            // Create OK button
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                // Code in this block will trigger when OK button tapped.
                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(OKAction)
            
            // Present Dialog message
            self.present(alertController, animated: true, completion:nil)
            
            
        }) { (_) in
            
        }
        

        
//        randomJokePopUp.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//            print("Handle Ok logic here")
//        }))

    }
    
    @IBAction func searchForJokeButtonPressed(_ sender: Any) {
        print("hello")
    }
    
    @IBAction func listOfJokesButtonPressed(_ sender: Any) {
        print("hello")
    }
}
