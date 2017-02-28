//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

class Counter {
    
    var id: Int
    var title: String
    
    fileprivate var counter: Int = 0
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
    public func increment() {
        self.counter += 1
    }
    
    public func decrement() {
        if self.counter > 0 {
            self.counter -= 1
        }
    }
    
    public func getCounter() -> Int {
        return self.counter
    }
    
}
