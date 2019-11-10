//
//  ViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit
import JokingFramework

class ViewController: UIViewController {
    
    

    
    
    
    override func viewDidLoad() {
        
        let jokesToolkit = JokesToolkit()
        
        jokesToolkit.initialise()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

