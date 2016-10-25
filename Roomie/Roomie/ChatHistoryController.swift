//
//  ViewController.swift
//  Roomie
//
//  Created by Guozhu Zheng on 10/12/16.
//  Copyright © 2016 Xmate. All rights reserved.
//


import UIKit

class ChatHistoryController: UITableViewController {

    private let cellId = "friendsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Recent"
        
        tableView?.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = 80
        
//        tableView.registerClass(ChatHistoryCell.self, forCellReuseIdentifier: cellId)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! FriendCell
        
        return cell
    }
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}


