//
//  GradientView.swift
//  Count!
//
//  Created by Sacha Schmid on 4.3.17.
//
//

import UIKit

class GradientView: UIView {
    
    var color: Color? {
        didSet {
            configureView()
        }
    }

    override open class var layerClass: AnyClass {
        get{
            return CAGradientLayer.classForCoder()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        if let color = color {
            let gradientLayer = self.layer as! CAGradientLayer
            gradientLayer.colors = [color.startColor.cgColor, color.endColor.cgColor]
            gradientLayer.cornerRadius = 5
        }
    }
    
}
