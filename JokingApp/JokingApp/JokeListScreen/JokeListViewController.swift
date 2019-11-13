//
//  JokeSearchViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit
import JokingFramework

protocol JokeListViewDelegate: AnyObject {
    func viewDidLoad()
    func fetchJokeBatch(success: @escaping ([Joke]) -> Void)
}

class JokeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    weak var delegate: JokeListViewDelegate?
    @IBOutlet weak var tableView: UITableView!
    var jokesToolkitAdapter: JokesToolkitAdapter!
    var fetchingMore = false
    var fullListOfItems = [String]()
    var newlyFetchedBatch = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: "loadingCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fullListOfItems.count
        } else if section == 1 && fetchingMore {
            return 1
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            cell.textLabel?.text = fullListOfItems[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = .byWordWrapping
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.spinner.startAnimating()
            return cell
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        
        if offsetY > contentHeight - scrollView.frame.height * 4 {
            if !fetchingMore {
                updateTableWithNewJokes()
            }
            
        }
        
    }

    func updateTableWithNewJokes() {
        fetchingMore = true
        fetchJokes()
        tableView.reloadSections(IndexSet(integer: 1), with: .fade)
        updateAfterDelay()
    }

    func fetchJokes() {
        self.delegate?.fetchJokeBatch(success: { jokes in
            for joke in jokes {
                self.newlyFetchedBatch.append(joke.joke)
            }
        }) 
    }
    
    fileprivate func updateAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let newItems = self.newlyFetchedBatch
            self.fullListOfItems.append(contentsOf: newItems)
            self.fetchingMore = false
            self.tableView.reloadData()
            self.newlyFetchedBatch.removeAll()
        })
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



