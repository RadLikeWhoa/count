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
    
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
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
            let gradientLayer = layer as! CAGradientLayer
            gradientLayer.colors = [color.startColor.cgColor, color.endColor.cgColor]
        }
    }
    
}
