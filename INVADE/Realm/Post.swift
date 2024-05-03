//
//  Post.swift
//  INVADE
//
//  Created by Taha Hussein on 03/05/2024.
//

import Foundation
import RealmSwift

class Post: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var stateProvince : String = ""
    @objc dynamic var country : String = ""
    @objc dynamic var alphaTwoCode : String = ""
//    @objc dynamic var webPages : [String] = [""]
//    @objc dynamic var domains : [String] = [""]
}
