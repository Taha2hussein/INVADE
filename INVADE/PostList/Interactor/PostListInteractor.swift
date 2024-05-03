//
//  PostListInteractor.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

class PostListInteractor: PostListInteractorInputProtocol {
    weak var presenter: PostListInteractorOutputProtocol?
    var localDatamanager: PostListLocalDataManagerInputProtocol?
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        do {
            if let postList = try localDatamanager?.retrievePostList() {
                let postModelList = postList.map() {
                    return PostModel( state_province: $0.stateProvince, name: $0.name, country: $0.country, alpha_two_code: $0.alphaTwoCode)
                }
                if  postModelList.isEmpty {
                    remoteDatamanager?.retrievePostList()
                }else{
                   presenter?.didRetrievePosts(postModelList)
                }
            } else {
                remoteDatamanager?.retrievePostList()
            }
            
        } catch {
            presenter?.didRetrievePosts([])
        }
    }
        
}

extension PostListInteractor: PostListRemoteDataManagerOutputProtocol {
    
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
        
        for postModel in posts {
            do {
                try localDatamanager?.savePost(name: postModel.name ?? "", stateProvince: postModel.state_province ?? "", country: postModel.country ?? "", alphaTwoCode: postModel.alpha_two_code ?? "")
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
