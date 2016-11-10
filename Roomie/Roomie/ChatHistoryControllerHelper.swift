//
//  ChatHistoryControllerHelper.swift
//  Roomie
//
//  Created by SuperGeorge on 10/25/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit
import CoreData

extension ChatHistoryController{
    
    
    //only for test
    func clearHistory(){
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            
            let allCvFr = NSFetchRequest(entityName: "Conversation")
            do{
                let allCv = try(context.executeFetchRequest(allCvFr) as? [NSManagedObject])
                for cv in allCv! {
                    context.deleteObject(cv)
                }
                try(context.save())
            }catch let err{
                print(err)
            }
            
        }
    }
    
    func loadHistory(){
       
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            
            //fake data 
            
            let f1 = NSEntityDescription.insertNewObjectForEntityForName("Friend", inManagedObjectContext: context) as! Friend
            f1.profileImage = "jobsprofile"
            f1.name = "Jobs"
            
            let f2 = NSEntityDescription.insertNewObjectForEntityForName("Friend", inManagedObjectContext: context) as! Friend
            f2.profileImage = "zuckprofile"
            f2.name = "Zuck"
            
            let m1 = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: context) as! Message
            m1.friend = f1
            m1.text = "This is Jobs"
            m1.time = NSDate()
            
            let m2 = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: context) as! Message
            m2.friend = f2
            m2.text = "This is Zuck"
            m2.time = NSDate().dateByAddingTimeInterval(60*3)
            
            do{
               try(context.save())
            }catch let err{
                print(err)
            }
            
            
            //Fetch all the fake data and rank by date
            let fetchRequest = NSFetchRequest(entityName: "Friend")
            let sort = NSSortDescriptor(key: "messages", ascending: false)
            fetchRequest.sortDescriptors = [sort]
            do{
                if let friends = try(context.executeFetchRequest(fetchRequest) as? [Friend]){
                    print(friends[1].name!)
                }
                
                
                
            }catch let err{
                print(err)
            }
        }
        
        
    }
}
