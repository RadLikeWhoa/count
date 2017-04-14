//
//  Color.swift
//  Count!
//
//  Created by Sacha Schmid on 14.4.17.
//
//

import RealmSwift

class Color: Object {
    
    // MARK: - Properties
    
    private dynamic var hexString = 0x000000
    
    var color: UIColor {
        return UIColor(hex: hexString)
    }
    
    var cgColor: CGColor {
        return color.cgColor
    }
    
    convenience init(hex: Int) {
        self.init()
        
        self.hexString = hex
    }
    
    // MARK: - Realm
    
    override static func primaryKey() -> String? {
        return "hexString"
    }
    
    override static func ignoredProperties() -> [String] {
        return [ "color" ]
    }
}
