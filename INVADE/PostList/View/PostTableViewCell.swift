//
//  PostTableViewCell.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 19/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit
import AlamofireImage

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var state: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forPost post: PostModel) {
        titleLabel?.text = post.name
        state.text = post.state_province
    }
}
