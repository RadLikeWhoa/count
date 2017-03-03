//
//  Color.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit

struct Color {
    
    let label: String
    let startColor: UIColor
    let endColor: UIColor
    
    init(label: String, startColor: UIColor, endColor: UIColor) {
        self.label = label
        self.startColor = startColor
        self.endColor = endColor
    }
    
}
