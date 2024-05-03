//
//  realmUtil.swift
//  INVADE
//
//  Created by Taha Hussein on 03/05/2024.
//

import Foundation
import Realm
import RealmSwift

class realmUtil {
    var realm: Realm! = try! Realm()

    func printRealm() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    func add(object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }

    func getFirstItem<T: RealmFetchable>(of type: T.Type) -> T? {
        return realm.objects(type).first
    }

    func getAll<T: RealmFetchable>() -> Results<T> {
        return realm.objects(T.self)
    }
}
