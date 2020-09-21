//
//  UserViewModel.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import Foundation

class UserViewModel: BaseViewModel {
    // MARK: variables
    private  let userRepo: UserRepoProtocol
    var cellViewModels: Observable<[UserCellViewModel]> =  Observable<[UserCellViewModel]>([])
        var users: [User] = []

    init(userRepo: UserRepoProtocol = UserRepo()) {
        self.userRepo = userRepo
    }
    
    // MARK: number of cells
    var numberOfCells: Int {
        return cellViewModels.value.count
    }
    // MARK: user select user from list
    func didSelectRow(row: Int) -> User {
        let user = users[row]
        return user
    }
    
    // MARK: get all users from realm DB
    func getAllUsers() {
       guard let users =  userRepo.getAllUsers() else {return}
        self.users = users
        createUserCellViewModel(users: users)
    }
    // MARK: create user cell view model
    func createUserCellViewModel(users: [User]) {
        cellViewModels.value = []
        for user in users {
            cellViewModels.value.append(UserCellViewModel(userName: user.userName, userAge: user.userAge))
        }
        self.state.value = .reloadingData
    }
    // MARK: save user to realm DB
    func saveUser(user: User) {
        user.identifer = incrementUser()
        userRepo.saveUser(user: user)
        getAllUsers()
    }
    // MARK: delete User from realm DB
    func deleteUser(user: User) {
        userRepo.deleteUser(user: user)
    }
    // MARK: Update User from realm DB
    func updateUser(user: User) {
        userRepo.updateUser(user: user)
    }
    func incrementUser() -> Int {
        return userRepo.increment() ?? 1
    }
}
