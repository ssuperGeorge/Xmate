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
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            
            let allCvFr = NSFetchRequest<NSFetchRequestResult>(entityName: "Conversation")
            do{
                let allCv = try(context.fetch(allCvFr) as? [NSManagedObject])
                for cv in allCv! {
                    context.delete(cv)
                }
                delegate?.saveContext()
            }catch let err{
                print(err)
            }
            
        }
    }
    
    func loadHistory() -> [Conversation]{
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            
            //Fake Data
//            let zuck = createFriend(name: "Zuck", profileImage: "zuckprofile")
//            
//            
//            let c1 = createConversation(title:"Guest")
//            c1?.addToParticipants(zuck!)
//            
//            c1?.addToChatLogs(createMessage(text: "This is Zuck", from: zuck!)!)
//            
//            delegate?.saveContext()
//            
            
            //Fetch all the persisted data and rank by date
            let fetchRequest:NSFetchRequest<Conversation> = Conversation.fetchRequest()
            let sort = NSSortDescriptor(key: "latestUpdateTime", ascending:true)
            fetchRequest.sortDescriptors = [sort]
            
            do{
                 return (try(context.fetch(fetchRequest)))
                
            }catch{
                print("Failed to load history")
            }
        }
        
        return []
    }
}
