//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

import Foundation

class Counter {
    
    // MARK: - Properties
    
    var title: String
    var gradient: Gradient
    
    private var count: Int = 0
    
    init(title: String = "", gradient: Gradient = Gradient.getRandomGradient()) {
        self.title = title
        self.gradient = gradient
    }
    
    // MARK: - Actions
    
    public func increment(value: Int = 1) {
        count += value
    }
    
    public func decrement() {
        if count > 0 {
            count -= 1
        }
    }
    
    public func getCount() -> Int {
        return count
    }
    
    public func reset() {
        count = 0
    }
    
}
