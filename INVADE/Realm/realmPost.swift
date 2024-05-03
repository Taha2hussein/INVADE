//
//  realmPost.swift
//  INVADE
//
//  Created by Taha Hussein on 03/05/2024.
//

import Foundation
import RealmSwift

struct realmPost {
    var util:realmUtil = realmUtil()
    
//    func add(from json:JSON){
//        add(from: util.collection(from: json))
//    }
    
    func add(from value:Any) {
        util.add(object: Post(value: value))
        print("sucess")
    }
    
    func getFirstPerson() -> Post{
        return util.getFirstItem(of: Post.self)!
    }
    
    func posts() -> Results<Post> {
        return util.getAll()
    }
    
}
