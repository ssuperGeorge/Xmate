//
//  MessageCell.swift
//  Roomie
//
//  Created by Guozhu Zheng on 11/14/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit

class MessageCell : BaseCell{
    
    var friend : Friend?{
        didSet{
            if let profileImage = friend?.profileImage{
                profileImageView.image = UIImage(named: profileImage)
            }
        }
    }
    
    var message : Message?{
        didSet{
            if let m = message?.text, let frame = superview?.frame{
                
                messageLabel.frame = CGRect(x: 80, y: 0, width: frame.width, height: frame.height)
                messageLabel.text = m
                
                if let f = message?.from{
                    friend = f
                }
            }
            
        }
    }
    
    private let messageLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.backgroundColor = UIColor.lightGray
        textLabel.font = UIFont.systemFont(ofSize: 16)
        return textLabel
    }()
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(profileImageView)
        addConstraintsWithFormat("H:|-12-[v0(42)]", views: profileImageView)
        addConstraintsWithFormat("V:[v0(42)]", views: profileImageView)
        
        addSubview(messageLabel)
//        
//        addConstraintsWithFormat("H:|-80-[v0]", views: messageLabel)
//        addConstraintsWithFormat("V:|[v0]", views: messageLabel)
    }
}

