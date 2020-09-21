//
//  BaseViewModel.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import Foundation

protocol BaseViewModelProtocol: class {
     var state: Observable<State> { get set }
}

class BaseViewModel: BaseViewModelProtocol {
    var state: Observable<State>
    init() {
       self.state = Observable<State>(.empty)
    }
}
