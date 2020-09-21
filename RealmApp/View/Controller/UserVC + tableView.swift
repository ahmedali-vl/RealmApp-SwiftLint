//
//  UserVC + tableView.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import UIKit

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        usersTableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        guard let userCell = cell else {  return UITableViewCell() }
        userCell.userNameLabel.text = userViewModel.cellViewModels.value[indexPath.row].userName
         userCell.userAgeLabel.text = "\(userViewModel.cellViewModels.value[indexPath.row].userAge!)"
        return userCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
