//
//  FriendCell.swift
//  Roomie
//
//  Created by Guozhu Zheng on 11/13/16.
//  Copyright © 2016 Xmate. All rights reserved.
//

import UIKit

class FriendCell:BaseCell{
    
    var friend:Friend?{
        didSet{
            if let f = friend {
                nameLabel.text = f.name
                profileImageView.image = UIImage(named: f.profileImage!)
            }
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
    
    override func setupViews() {
        addSubview(dividerLineView)
        addSubview(profileImageView)
        
        setupContainerView()
        
        addConstraintsWithFormat("H:|-12-[v0(36)]", views: profileImageView)
        addConstraintsWithFormat("V:[v0(36)]", views: profileImageView)
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
        
        containerView.addConstraintsWithFormat("H:|[v0]-12-|", views: nameLabel)
        containerView.addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
    }
    
}
