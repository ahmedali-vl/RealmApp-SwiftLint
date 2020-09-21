//
//  ViewController.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/20/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import UIKit

class UsersViewController: BaseViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    var userViewModel: UserViewModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users 🏹 👨‍👩‍👧‍👧"
        setupTableView()
        setubObservers(viewModel: userViewModel)
        userViewModel.getAllUsers()
    }

    override func reloadData() {
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
    }
    
    @IBAction func addUserAction(_ sender: Any) {
        showAddUserAlert()
    }
    
    func showAddUserAlert() {
        let alertController = UIAlertController(title: "Add User", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "user name"
        }
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "user age"
            textField.keyboardType = .numberPad
        }

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ -> Void in
            if let nameTextField = alertController.textFields?[0], let ageTF = alertController.textFields?[1] {
                if nameTextField.text!.count > 0  && ageTF.text!.count > 0 {
                    let user = User()
                    user.userName =  nameTextField.text!
                    user.userAge = Int(ageTF.text!)!
                    self?.userViewModel.saveUser(user: user)
                }
            }
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { ( _ : UIAlertAction!) -> Void in })

        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)

        alertController.preferredAction = saveAction

        self.present(alertController, animated: true, completion: nil)
    }
}
