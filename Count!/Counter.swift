//
//  Counter.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

import Foundation
import RealmSwift

class Counter: Object {
    
    // MARK: - Properties
    
    dynamic var id: String = NSUUID().uuidString
    dynamic var title: String = ""
    dynamic var gradient: Gradient?
    
    private dynamic var count: Int = 0
    
    convenience init(title: String = "", gradient: Gradient?) {
        self.init()
        
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
    
    // MARK: - Realm
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
