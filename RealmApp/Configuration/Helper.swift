//
//  Helper.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import UIKit

class Helper {
    static let  activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    // MARK: show activity indicator
    class func showIndicator(view: UIView, color: UIColor) {
        activityIndicator.center = view.center
        activityIndicator.color = color
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    //
    class func hideIndicator() {
        activityIndicator.stopAnimating()
    }
    class func showAlert( message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        }))
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
}
