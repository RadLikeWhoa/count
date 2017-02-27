//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

import UIKit

class Counter {
    fileprivate let title: String
    fileprivate var counter: Int = 0
    
    init(title: String) {
        self.title = title
    }
    
    public func increment() {
        self.counter += 1
    }
    
    public func decrement() {
        self.counter -= 1
    }
}
