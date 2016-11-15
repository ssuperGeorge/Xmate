//
//  TestViewController.swift
//  Roomie
//
//  Created by Guozhu Zheng on 10/12/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit

class ChatLogController: UITableViewController{
    
    private var friends: NSSet?
    private var chatlog: NSOrderedSet?
    private let cellId = "logCell"
    
    var conversation : Conversation?{
        
        didSet{
            friends = conversation?.participants
            chatlog = conversation?.chatLogs
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cv = conversation{
            navigationItem.title = cv.title
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let n = chatlog?.count{
            return n
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell
        
        if let message = chatlog?[indexPath.item] as? Message{
            cell.message = message
        }
        
        return cell
    }

    
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox
    }
}

