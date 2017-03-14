//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

class Counter {
    
    // MARK: - Properties
    
    var title: String
    var color: Color
    
    private var count: Int = 0
    
    init(title: String = "", color: Color = Color.availableColors[0]) {
        self.title = title
        self.color = color
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
