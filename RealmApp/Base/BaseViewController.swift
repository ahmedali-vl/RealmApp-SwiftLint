//
//  BaseViewController.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController {

    // MARK: - Controller lifecycle
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
     }
    
    func setubObservers(viewModel: BaseViewModel) {
        
        viewModel.state.addAndNotify(observer: self) { [weak self] state in
            DispatchQueue.main.async {
                guard let self = self else {return}
                switch  state {
                case .empty:
                    Helper.hideIndicator()
                case .error(let message):
                    Helper.showAlert(message: message, title: "")
                    Helper.hideIndicator()
                case .loading:
                    Helper.showIndicator(view: self.view, color: .gray)
                case .populated:
                    Helper.hideIndicator()
                case .reloadingData:
                    DispatchQueue.main.async {
                        self.reloadData()
                    }
                }
            }
        }
    }
    
    func reloadData() {}
}
