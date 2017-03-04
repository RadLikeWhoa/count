//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

class Counter {
    
    var title: String
    var color: Color
    
    fileprivate var counter: Int = 0
    
    init(title: String, color: Color = Color.availableColors[0]) {
        self.title = title
        self.color = color
    }
    
    public func increment(value: Int = 1) {
        counter += value
    }
    
    public func decrement() {
        if counter > 0 {
            counter -= 1
        }
    }
    
    public func getCounter() -> Int {
        return counter
    }
    
}
