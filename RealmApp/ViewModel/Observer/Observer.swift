//
//  Observer.swift
//  RealmApp
//
//  Created by Ahmed Ali on 9/21/20.
//  Copyright © 2020 Ahmed Ali. All rights reserved.
//

import Foundation
import Foundation
class Observable<T> {
    typealias CompletionHandler = ((T) -> Void)
    var value: T {
        didSet {
            self.notify()
        }
    }
    var observers: [String: CompletionHandler ] = [:]
    
    init(_ value: T) {
        self.value = value
    }

    private  func notify() {
        observers.forEach({$0.value(value)})
    }
    func addObserver(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer: observer, completionHandler: completionHandler)
        self.notify()
    }
    
    deinit {
        observers.removeAll()
    }
}
