//
//  JokeSearchViewController.swift
//  JokingApp
//
//  Created by Faisal Rahman on 10/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import UIKit

protocol JokeListViewDelegate: AnyObject {
    
    //TODO
}

class JokeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    weak var delegate: JokeListViewDelegate?
    @IBOutlet weak var tableView: UITableView!
    var jokesToolkitAdapter: JokesToolkitAdapter!
    var fetchingMore = false
    var items = [String]()
    var fetchedItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        jokesToolkitAdapter = JokesToolkitAdapter()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: "loadingCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        fetchJokeBatch()


        
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
            return items.count
        } else if section == 1 && fetchingMore {
            return 1
        }
        return 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            cell.textLabel?.text = items[indexPath.row]
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
                beginBatchFetch()
            }
            
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        fetchJokeBatch()
        print("beginBatchFetch!")
        tableView.reloadSections(IndexSet(integer: 1), with: .fade)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            //The +12 here increases the amount of cells to populate
            let newItems = self.fetchedItems
            self.items.append(contentsOf: newItems)
            self.fetchingMore = false
            self.tableView.reloadData()
        })
    }
    
    func fetchJokeBatch() {
        self.fetchedItems.removeAll()
        self.jokesToolkitAdapter.getABatchOfEightRandomJokes(success: { jokes in
            for joke in jokes {
                self.fetchedItems.append(joke.joke)
            }
        }) { (blah) in
            print(blah)
            
        }
    }


}
