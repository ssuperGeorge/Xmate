//
//  ViewController.swift
//  Roomie
//
//  Created by Guozhu Zheng on 10/12/16.
//  Copyright © 2016 Xmate. All rights reserved.
//


import UIKit

class ChatHistoryController: UITableViewController {
    
    

    fileprivate let cellId = "ConversationCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Roomie"
        clearHistory()
        loadHistory()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ConversationCell
        
        return cell
    }
    
    
}




