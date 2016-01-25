//
//  ViewController.swift
//  MLSelfSizingCells_Swift
//
//  Created by Matthias Ludwig on 25.01.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

import UIKit

class MLTableViewController: UITableViewController {

    
    var contentArray = [Dictionary<String, String>]()
    
    // MARK: ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Self Sizing Swift", comment: "")
        view.backgroundColor = .lightTextColor()
        
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.registerClass(MLTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        for var index = 0; index < 100; ++index {
            contentArray.append([
                    "sentence": Lorem.sentence,
                    "name": Lorem.name
                ])
        }
        
        tableView.reloadData()
        
        
        
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MLTableViewCell
        
        let dictionary = contentArray[indexPath.row]
        
        cell.sentenceLabel.text = dictionary["sentence"]
        cell.nameLabel.text = dictionary["name"]
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

