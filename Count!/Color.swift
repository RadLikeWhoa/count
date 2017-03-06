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
        Color(label: "Sha La La", startColor: UIColor(hex: 0xE29587), endColor: UIColor(hex: 0xD66D75)),
        Color(label: "Solid Vault", startColor: UIColor(hex: 0x3a7bd5), endColor: UIColor(hex: 0x3a6073)),
        Color(label: "Horizon", startColor: UIColor(hex: 0xE5E5BE), endColor: UIColor(hex: 0x003973)),
        Color(label: "Noon to Dusk", startColor: UIColor(hex: 0xbfe9ff), endColor: UIColor(hex: 0xff6e7f)),
        Color(label: "Cherry", startColor: UIColor(hex: 0xF45C43), endColor: UIColor(hex: 0xEB3349)),
        Color(label: "Titanium", startColor: UIColor(hex: 0x859398), endColor: UIColor(hex: 0x283048)),
        Color(label: "Calm Darya", startColor: UIColor(hex: 0x49a09d), endColor: UIColor(hex: 0x5f2c82)),
        Color(label: "Kyoto", startColor: UIColor(hex: 0xffc500), endColor: UIColor(hex: 0xc21500)),
        Color(label: "Dirty Fog", startColor: UIColor(hex: 0x8CA6DB), endColor: UIColor(hex: 0xB993D6)),
        Color(label: "Shore", startColor: UIColor(hex: 0x70e1f5), endColor: UIColor(hex: 0xffd194)),
        Color(label: "Sunset", startColor: UIColor(hex: 0xF56217), endColor: UIColor(hex: 0x0B486B)),
        Color(label: "Instagram", startColor: UIColor(hex: 0x517fa4), endColor: UIColor(hex: 0x243949)),
        Color(label: "Piglet", startColor: UIColor(hex: 0xffdde1), endColor: UIColor(hex: 0xee9ca7)),
        Color(label: "Master Card", startColor: UIColor(hex: 0xeea849), endColor: UIColor(hex: 0xf46b45)),
        Color(label: "Inbox", startColor: UIColor(hex: 0x5691c8), endColor: UIColor(hex: 0x457fca)),
        Color(label: "Lush", startColor: UIColor(hex: 0xa8e063), endColor: UIColor(hex: 0x56ab2f)),
        Color(label: "The Blue Lagoon", startColor: UIColor(hex: 0x43C6AC), endColor: UIColor(hex: 0x191654)),
        Color(label: "Venice", startColor: UIColor(hex: 0xA7BFE8), endColor: UIColor(hex: 0x6190E8)),
        Color(label: "Emerald Water", startColor: UIColor(hex: 0x56B4D3), endColor: UIColor(hex: 0x348F50)),
        Color(label: "Mojito", startColor: UIColor(hex: 0x93F9B9), endColor: UIColor(hex: 0x1D976C))
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
