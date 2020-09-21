//
//  User.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers class User: Object {
    dynamic var userName: String = ""
    dynamic var userAge: Int = 0
    dynamic var identifer = 0
    
    override static func primaryKey() -> String? {
        return "identifer"
    }
}
