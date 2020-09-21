//
//  State.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import Foundation

public enum State {
    case loading
    case error(error: String)
    case empty
    case reloadingData
    case populated
}
