//
//  Color.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit
import RealmSwift

class Gradient: Object {
    
    // MARK: - Properties
    
    dynamic var label: String = ""
    dynamic var from: Color?
    dynamic var to: Color?
    
    convenience init(label: String, from: Color, to: Color) {
        self.init()
        
        self.label = label
        self.from = from
        self.to = to
    }
    
    // MARK: - Realm
    
    override static func primaryKey() -> String? {
        return "label"
    }
    
}
