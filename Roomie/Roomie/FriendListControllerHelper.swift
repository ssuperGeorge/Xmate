//
//  FriendListControllerHelper.swift
//  Roomie
//
//  Created by Guozhu Zheng on 11/12/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit
import CoreData

extension FriendListController{
    
    func clearFriends() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            let friendFetchRequest:NSFetchRequest<Friend> = Friend.fetchRequest()
            do{
                let friends = try(context.fetch(friendFetchRequest))
                for f in friends{
                    context.delete(f)
                }
                
                delegate?.saveContext()
            }catch{
                print("Failed clearing friend data")
            }
        }
    }
    
    func loadFriends() -> [Friend]?{
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            let friendFr : NSFetchRequest<Friend> = Friend.fetchRequest()
            do{
                 return try(context.fetch(friendFr))   
            }catch{
                print("Failed to fetch the list of friends")
            }
        }
        return nil
    }
    
}
