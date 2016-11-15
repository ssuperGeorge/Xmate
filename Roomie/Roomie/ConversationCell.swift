//
//  FriendCell.swift
//  Roomie
//
//  Created by SuperGeorge on 10/25/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit

class ConversationCell: BaseCell {

    var conversation:Conversation?{
    
        didSet{
            nameLabel.text = conversation?.title
            if let messages = conversation?.chatLogs{
                let lastMessage = messages.lastObject as! Message
                messageLabel.text = lastMessage.text
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "H:mm"
                timeLabel.text = dateFormatter.string(from: lastMessage.sentDate as! Date)
            }
            let friend = conversation?.participants?.anyObject() as! Friend
            profileImageView.image = UIImage(named: friend.profileImage!)
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.1)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    override func setupViews() {
        addSubview(dividerLineView)
        addSubview(profileImageView)
        
        setupContainerView()
        
        addConstraintsWithFormat("H:|-12-[v0(58)]", views: profileImageView)
        addConstraintsWithFormat("V:[v0(58)]", views: profileImageView)
        addConstraintsWithFormat("H:|-12-[v0]|", views: dividerLineView)
        addConstraintsWithFormat("V:[v0(1)]|", views: dividerLineView)
        
        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    fileprivate func setupContainerView() {
        let containerView = UIView()
        
        addSubview(containerView)
        
        addConstraintsWithFormat("H:|-80-[v0]|", views: containerView)
        addConstraintsWithFormat("V:[v0(50)]", views: containerView)
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(timeLabel)
        
        containerView.addConstraintsWithFormat("H:|[v0][v1(80)]-12-|", views: nameLabel, timeLabel)
        containerView.addConstraintsWithFormat("V:|[v0][v1(24)]|", views: nameLabel, messageLabel)
        containerView.addConstraintsWithFormat("H:|[v0]-30-|", views: messageLabel)
        containerView.addConstraintsWithFormat("V:|[v0(24)]", views: timeLabel)
    }
    
}

