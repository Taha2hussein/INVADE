//
//  PostListPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import Foundation

class PostListPresenter: PostListPresenterProtocol {
    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    var postList: [PostModel] = []
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        view?.showLoading()
        interactor?.retrievePostList()
        print("reree")
    }
    
    func showPostDetail(forPost post: PostModel) {
        wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }

    func getPostListCount() -> Int? {
        return self.postList.count
    }
    
    func cellPostItem(indexPath: IndexPath, cell: PostTableViewCell) {
          let post = getPostItem(indexPath: indexPath)
            cell.set(forPost: post)
    }
    
    func getPostSelected(indexPath:IndexPath) -> PostModel {
         let post = getPostItem(indexPath: indexPath)
            return post
    }
    
    func getPostItem(indexPath:IndexPath)-> PostModel {
         let post = self.postList[indexPath.row]
        return post
      
    }
}

extension PostListPresenter: PostListInteractorOutputProtocol {
  
    func didRetrievePosts(_ posts: [PostModel]) {
        view?.hideLoading()
        view?.showPosts(with: posts)
        self.postList = posts
    }
    
    func onError() {
        view?.hideLoading()
    }

    
}


