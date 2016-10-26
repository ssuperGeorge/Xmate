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
    
    func clearHistory(){
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            
            let allMessagesFr = NSFetchRequest(entityName: "Message")
            do{
                let allMessages = try(context.executeFetchRequest(allMessagesFr) as? [NSManagedObject])
                for message in allMessages! {
                    context.deleteObject(message)
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
            3
            let fetchRequest = NSFetchRequest(entityName: "Message")
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]
            
            do{
                let messages = try(context.executeFetchRequest(fetchRequest) as? [Message])
                
                var visited = [String:Message]()
                
                for m in messages!{
                    if let name = m.friend?.name{
                        if(visited[name]==nil){
                            visited[name] = m
                        }
                    }
                }
            }catch let err{
                print(err)
            }
        }
        
        
    }
}
