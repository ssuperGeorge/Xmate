//
//  Conversation+CoreDataProperties.swift
//  Roomie
//
//  Created by Guozhu Zheng on 11/9/16.
//  Copyright © 2016 Xmate. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Conversation {

    @NSManaged var latestUpdateTime: NSDate?
    @NSManaged var title: String?
    @NSManaged var participants: NSSet?
    @NSManaged var chatLogs: NSSet?

}
