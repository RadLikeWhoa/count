//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

import UIKit

class Counter {
    final let id: Int
    final let title: String
    
    fileprivate var counter: Int = 0
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
    public func increment() {
        self.counter += 1
    }
    
    public func decrement() {
        self.counter -= 1
    }
    
    public func getCounter() -> Int {
        return self.counter
    }
}
