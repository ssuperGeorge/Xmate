//
//  FriendListController.swift
//  Roomie
//
//  Created by Guozhu Zheng on 11/11/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit

class FriendListController: UITableViewController{
    
    private var friends: [Friend]?
    private let cellId = "friendCell"
    private let segueId = "showChatLog"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        clearFriends()
        friends = loadFriends()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let n = friends?.count{
            return n
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FriendCell
        if let friend = friends?[indexPath.item]{
            cell.friend = friend
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == segueId){
            let dest = segue.destination as! ChatLogController
            
            if let selectedRow = tableView.indexPathForSelectedRow?.item{
                let friend = friends?[selectedRow]
                dest.conversation = createConversation(title: friend?.name)
                dest.conversation?.addToParticipants(friend!)
                dest.conversation?.addToChatLogs(createMessage(text: "Hi thereakbia aobnvbralkbnvabviabrivabrvakv irh vaekr vaber vkrvbjf  mer vjaer vk", from: friend!)!)
                //Save context
                let delegate = UIApplication.shared.delegate as? AppDelegate
                delegate?.saveContext()
            }
        }
    }
}









