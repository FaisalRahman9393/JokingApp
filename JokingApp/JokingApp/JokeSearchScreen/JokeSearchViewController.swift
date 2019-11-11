//
//  JokeSearchViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit

protocol JokeSearchViewDelegate: AnyObject{
    
    //TODO
}

class JokeSearchViewController: UIViewController {
    
    weak var delegate: JokeSearchViewDelegate?
    @IBOutlet var jokeSearchLabel: UILabel!
    @IBOutlet var jokeSearchTextBox: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func jokeSearchPressed(_ sender: Any) {
        print("")
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
