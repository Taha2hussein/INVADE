//
//  PostDetailView.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class PostDetailView: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    var presenter: PostDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func BackAction(_ sender: Any) {
        presenter?.dismiss()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        presenter?.refresh()
    }
}

extension PostDetailView: PostDetailViewProtocol {
    
    func showPostDetail(forPost post: PostModel) {
        nameLabel?.text = post.name
        stateLabel?.text = post.state_province
        countryLabel?.text = post.country
        codeLabel.text = post.alpha_two_code
    }
    
}
