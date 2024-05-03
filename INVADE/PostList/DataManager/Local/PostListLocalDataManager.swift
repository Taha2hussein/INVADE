//
//  PostListLocalDataManager.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import CoreData

class PostListLocalDataManager:PostListLocalDataManagerInputProtocol {
    let rP :realmPost = realmPost()
    func retrievePostList() throws -> [Post]  {
 
        let result = rP.posts()
        print(result , "resultresult")
        return Array(result)
    }
    
    func savePost(name: String, stateProvince: String, country: String, alphaTwoCode: String ) throws {
        let profile = ["name":name,
                       "stateProvince":stateProvince,
                       "country": country,
                       "alphaTwoCode": alphaTwoCode,
//                       "domains": domains,
//                       "webPages": webPages
        ] as [String : Any]
        
     
        rP.add(from: profile)
    }
    
}
