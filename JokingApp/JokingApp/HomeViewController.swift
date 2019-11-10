//
//  HomeViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit

protocol HomeDelegate: AnyObject {
    
    //TODO
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeDelegate?
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
    
    

}
