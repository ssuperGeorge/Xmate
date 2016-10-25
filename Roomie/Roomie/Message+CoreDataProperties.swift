//
//  Message+CoreDataProperties.swift
//  Roomie
//
//  Created by SuperGeorge on 10/25/16.
//  Copyright © 2016 Xmate. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Message {

    @NSManaged var text: String?
    @NSManaged var time: NSDate?
    @NSManaged var friend: Friend?

}
