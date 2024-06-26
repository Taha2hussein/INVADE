//
//  PostDetailPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

class PostDetailPresenter: PostDetailPresenterProtocol {
    
    weak var view: PostDetailViewProtocol?
    var wireFrame: PostDetailWireFrameProtocol?
    var post: PostModel?
    weak var delegate: RefreshProtocolDelegate?

    func viewDidLoad() {
        view?.showPostDetail(forPost: post!)
    }
    
    func dismiss() {
        wireFrame?.dismiss(from: self.view!)
    }
    
    func refresh() {
        delegate?.refreshPosts()
    }
}

