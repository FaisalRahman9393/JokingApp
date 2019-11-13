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
    
    func jokeSearchPressed(name: String)
    
}

class JokeSearchViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: JokeSearchViewDelegate?
    @IBOutlet var jokeSearchLabel: UILabel!
    @IBOutlet var jokeSearchTextBox: UITextField!
    var jokingAdapter = JokesToolkitAdapter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeSearchTextBox.delegate = self
    }
    
    
    @IBAction func jokeSearchPressed(_ sender: Any) {
        guard let nameToSearch = jokeSearchTextBox.text else { return }
        delegate?.jokeSearchPressed(name: nameToSearch)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text?.removeAll()
    }
    
    func updateTextLabel(message: String) {
        self.jokeSearchLabel.text = message
    }
    
    func presentMessage(messageToShow: String, title: String) {
            let alertController = UIAlertController(title: title, message: messageToShow, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
    }

}
