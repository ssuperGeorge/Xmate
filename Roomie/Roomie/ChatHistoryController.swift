//
//  ViewController.swift
//  Roomie
//
//  Created by Guozhu Zheng on 10/12/16.
//  Copyright © 2016 Xmate. All rights reserved.
//


import UIKit

class ChatHistoryController: UITableViewController {
    
    private var conversations:[Conversation]?
    fileprivate let segueId = "showChatlog"
    fileprivate let cellId = "ConversationCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Roomie"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        clearHistory()
        conversations = loadHistory()
        tableView.reloadData()
        
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let n = conversations?.count{
            return n
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ConversationCell
        cell.conversation = conversations?[indexPath.item]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == segueId){
            let dest = segue.destination as? ChatLogController
            if let selectedRow = tableView.indexPathForSelectedRow?.item{
                dest?.conversation = conversations?[selectedRow]
            }
        }
    }
}




