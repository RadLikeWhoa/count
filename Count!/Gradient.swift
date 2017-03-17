//
//  Color.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit

struct Gradient {
    
    // MARK: - Properties
    
    static let availableGradients = [
        Gradient("Sha La La", from: UIColor(hex: 0xE29587), to: UIColor(hex: 0xD66D75)),
        Gradient("Cherry", from: UIColor(hex: 0xF45C43), to: UIColor(hex: 0xEB3349)),
        Gradient("Dirty Fog", from: UIColor(hex: 0x8CA6DB), to: UIColor(hex: 0xB993D6)),
        Gradient("Instagram", from: UIColor(hex: 0x517fa4), to: UIColor(hex: 0x243949)),
        Gradient("Piglet", from: UIColor(hex: 0xffdde1), to: UIColor(hex: 0xee9ca7)),
        Gradient("Master Card", from: UIColor(hex: 0xeea849), to: UIColor(hex: 0xf46b45)),
        Gradient("Lush", from: UIColor(hex: 0xa8e063), to: UIColor(hex: 0x56ab2f)),
        Gradient("Venice", from: UIColor(hex: 0xA7BFE8), to: UIColor(hex: 0x6190E8)),
        Gradient("Emerald Water", from: UIColor(hex: 0x56B4D3), to: UIColor(hex: 0x348F50)),
        Gradient("Mojito", from: UIColor(hex: 0x93F9B9), to: UIColor(hex: 0x1D976C))
    ]
    
    let label: String
    let from: UIColor
    let to: UIColor
    
    init(_ label: String, from: UIColor, to: UIColor) {
        self.label = label
        self.from = from
        self.to = to
    }
    
    // MARK: - Actions
    
    static func getRandomGradient() -> Gradient {
        let random = Int(arc4random_uniform(UInt32(Gradient.availableGradients.count)))
        return Gradient.availableGradients[random]
    }
    
}
