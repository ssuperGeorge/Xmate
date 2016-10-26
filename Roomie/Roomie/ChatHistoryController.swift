//
//  ViewController.swift
//  Roomie
//
//  Created by Guozhu Zheng on 10/12/16.
//  Copyright © 2016 Xmate. All rights reserved.
//


import UIKit

class ChatHistoryController: UITableViewController {
    
    private var messages: [Message]?

    private let cellId = "friendsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Roomie"
        clearHistory()
        loadHistory()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let n = messages?.count{
            return n
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! FriendCell
        if let message = messages?[indexPath.row] {
            cell.message = message
        }
        return cell
    }
}




