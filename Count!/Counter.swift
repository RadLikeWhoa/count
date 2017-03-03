//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

class Counter {
    
    var title: String
    var offset: Int
    var color: Color
    
    fileprivate var counter: Int = 0
    
    init(title: String, offset: Int = 0, color: Color = Color.availableColors[0]) {
        self.title = title
        self.offset = offset
        self.color = color
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
