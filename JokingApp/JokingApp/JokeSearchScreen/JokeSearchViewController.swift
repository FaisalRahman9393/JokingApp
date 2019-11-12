//
//  JokeSearchViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit
import JokingFramework

protocol JokeSearchViewDelegate: AnyObject{
    
    //TODO
}

class JokeSearchViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: JokeSearchViewDelegate?
    @IBOutlet var jokeSearchLabel: UILabel!
    @IBOutlet var jokeSearchTextBox: UITextField!
    var jokingAdapter = JokesToolkitAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeSearchTextBox.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func jokeSearchPressed(_ sender: Any) {
        
        
        guard let nameToSearch = jokeSearchTextBox.text else {
            return
        }
        
        var components = nameToSearch.components(separatedBy:" ")
        if((components.count > 0)) {
            let firstName = components.removeFirst()
            let lastName = components.joined(separator: " ")
            
            jokingAdapter.getACustomJoke(firstName: firstName, lastName: lastName, success: { (jokeRetrived) in
                self.jokeSearchLabel.text = jokeRetrived.joke
            }) { (_) in
                
            }

        } else {
            print("Invalid name")
        }

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text?.removeAll()
    }
    
  
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
