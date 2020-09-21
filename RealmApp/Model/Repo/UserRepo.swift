//
//  UserRepo.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import UIKit
protocol UserRepoProtocol {
    func getAllUsers() -> [User]?
    func deleteUser(user: User)
    func updateUser(user: User)
    func saveUser(user: User)
    func increment() -> Int?
}
class UserRepo: UserRepoProtocol {
    
   lazy var userDBO = RealmDB<User>()
    
    func saveUser(user: User) {
        userDBO.save(user)
    }
    func getAllUsers() -> [User]? {
       return userDBO.findAll()
    }

    func deleteUser(user: User) {
        userDBO.delete(user)
    }
    
    func updateUser(user: User) {
        userDBO.update(user)
    }
    func increment() -> Int? {
        guard let count =  userDBO.incrementaID() else {return nil}
        return count
    }
}
