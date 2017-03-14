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
        Gradient("Solid Vault", from: UIColor(hex: 0x3a7bd5), to: UIColor(hex: 0x3a6073)),
        Gradient("Horizon", from: UIColor(hex: 0xE5E5BE), to: UIColor(hex: 0x003973)),
        Gradient("Noon to Dusk", from: UIColor(hex: 0xbfe9ff), to: UIColor(hex: 0xff6e7f)),
        Gradient("Cherry", from: UIColor(hex: 0xF45C43), to: UIColor(hex: 0xEB3349)),
        Gradient("Titanium", from: UIColor(hex: 0x859398), to: UIColor(hex: 0x283048)),
        Gradient("Calm Darya", from: UIColor(hex: 0x49a09d), to: UIColor(hex: 0x5f2c82)),
        Gradient("Kyoto", from: UIColor(hex: 0xffc500), to: UIColor(hex: 0xc21500)),
        Gradient("Dirty Fog", from: UIColor(hex: 0x8CA6DB), to: UIColor(hex: 0xB993D6)),
        Gradient("Shore", from: UIColor(hex: 0x70e1f5), to: UIColor(hex: 0xffd194)),
        Gradient("Sunset", from: UIColor(hex: 0xF56217), to: UIColor(hex: 0x0B486B)),
        Gradient("Instagram", from: UIColor(hex: 0x517fa4), to: UIColor(hex: 0x243949)),
        Gradient("Piglet", from: UIColor(hex: 0xffdde1), to: UIColor(hex: 0xee9ca7)),
        Gradient("Master Card", from: UIColor(hex: 0xeea849), to: UIColor(hex: 0xf46b45)),
        Gradient("Inbox", from: UIColor(hex: 0x5691c8), to: UIColor(hex: 0x457fca)),
        Gradient("Lush", from: UIColor(hex: 0xa8e063), to: UIColor(hex: 0x56ab2f)),
        Gradient("The Blue Lagoon", from: UIColor(hex: 0x43C6AC), to: UIColor(hex: 0x191654)),
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
    
}
