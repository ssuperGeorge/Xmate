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
                try(context.save())
            }catch let err{
                print(err)
            }
            
        }
    }
    
    func loadHistory(){
       
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext{
            //Fetch all the fake data and rank by date
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
            let sort = NSSortDescriptor(key: "messages", ascending: false)
            fetchRequest.sortDescriptors = [sort]
            do{
                if let friends = try(context.fetch(fetchRequest) as? [Friend]){
                    print(friends[1].name!)
                }
                
                
                
            }catch let err{
                print(err)
            }
        }
        
        
    }
}
