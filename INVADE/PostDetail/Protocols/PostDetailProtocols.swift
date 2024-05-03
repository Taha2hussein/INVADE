//
//  PostDetailProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

protocol RefreshProtocolDelegate: class {
   func refreshPosts()
}

protocol PostDetailViewProtocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPostDetail(forPost post: PostModel)
}

protocol PostDetailWireFrameProtocol: class {
    static func createPostDetailModule( forPost post: PostModel,delegate: RefreshProtocolDelegate?) -> UIViewController
    // presenter --> wireframe
    func dismiss(from view: PostDetailViewProtocol)
}

protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var delegate: RefreshProtocolDelegate? { get set }

    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var post: PostModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func dismiss()
    func refresh()
}
