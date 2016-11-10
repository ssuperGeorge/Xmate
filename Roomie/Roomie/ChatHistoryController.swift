//
//  ViewController.swift
//  Roomie
//
//  Created by Guozhu Zheng on 10/12/16.
//  Copyright © 2016 Xmate. All rights reserved.
//


import UIKit

class ChatHistoryController: UITableViewController {
    
    var conversations: [Conversation]?

    private let cellId = "ConversationCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Roomie"
        clearHistory()
        loadHistory()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let n = conversations?.count{
            return n
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! ConversationCell
        
        return cell
    }
    
    
}




