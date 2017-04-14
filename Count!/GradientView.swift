//
//  GradientView.swift
//  Count!
//
//  Created by Sacha Schmid on 4.3.17.
//
//

import UIKit

class GradientView: UIView {
    
    // MARK: - Properties
    
    var gradient: Gradient? {
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
    
    // MARK: - View
    
    private func configureView() {
        if let gradient = gradient {
            let gradientLayer = layer as! CAGradientLayer
            gradientLayer.colors = [ gradient.from!.cgColor, gradient.to!.cgColor ]
        }
    }
    
}
