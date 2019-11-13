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
    func randomJokeButtonPressed()
}

protocol SegueDelegate: AnyObject {
    func searchButtonPressed()
    func listButtonPressed()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewDelegate?
    weak var segueDelegate: SegueDelegate?
    var jokesAdapter = JokesToolkitAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomJokeButtonPressed(_ sender: Any) {
        delegate?.randomJokeButtonPressed()
    }
    
    @IBAction func searchForJokeButtonPressed(_ sender: Any) {
    }
    
    @IBAction func listOfJokesButtonPressed(_ sender: Any) {
    }
    
    func presentMessage(messageToShow: String, title: String) {
        let alertController = UIAlertController(title: title, message: messageToShow, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "searchSegue"{
            self.segueDelegate?.searchButtonPressed()
            return false

        }
        if identifier == "listSegue"{
            self.segueDelegate?.listButtonPressed()
            return false
        }
        return false

    }
    
    
}
