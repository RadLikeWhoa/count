//
//  Color.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit

struct Color {
    
    static let availableColors = [
        Color(label: "Sha La La", startColor: UIColor(red: 0.886, green: 0.584, blue: 0.529, alpha: 1.00), endColor: UIColor(red: 0.839, green: 0.427, blue: 0.459, alpha: 1.00)),
        Color(label: "Under The Lake", startColor: UIColor(red: 0.137, green: 0.478, blue: 0.341, alpha: 1.00), endColor: UIColor(red: 0.035, green: 0.188, blue: 0.157, alpha: 1.00)),
        Color(label: "Solid Vault", startColor: UIColor(red: 0.227, green: 0.482, blue: 0.835, alpha: 1.00), endColor: UIColor(red: 0.227, green: 0.376, blue: 0.451, alpha: 1.00))
    ]
    
    let label: String
    let startColor: UIColor
    let endColor: UIColor
    
    init(label: String, startColor: UIColor, endColor: UIColor) {
        self.label = label
        self.startColor = startColor
        self.endColor = endColor
    }
    
}
