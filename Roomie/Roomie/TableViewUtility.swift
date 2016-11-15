//
//  TableViewUtility.swift
//  Roomie
//
//  Created by Guozhu Zheng on 11/14/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit
import CoreData

extension UITableViewController{
    func createFriend(name: String, profileImage: String?) -> Friend?{
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.managedObjectContext{
            let friend = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as? Friend
            friend?.name = name
            friend?.profileImage = profileImage
            return friend
        }
        return nil
    }
    
    func createMessage(text: String, from: Friend) -> Message?{
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.managedObjectContext{
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as? Message
            message?.text = text
            message?.from = from
            message?.sentDate = NSDate()
            return message
        }
        return nil
    }
    
    func createConversation(title:String?) -> Conversation? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.managedObjectContext{
            let conversation = NSEntityDescription.insertNewObject(forEntityName: "Conversation", into: context) as? Conversation
            
            
            if let t = title{
                conversation?.title = t
            }
            return conversation
            
        }
        return nil
    }
}
