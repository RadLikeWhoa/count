//
//  CounterButton.swift
//  Count!
//
//  Created by Sacha Schmid on 5.3.17.
//
//

import UIKit

class CounterButton: UIButton {
    
    @IBInspectable var defaultBackground: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            backgroundColor = defaultBackground
        }
    }
    
    @IBInspectable var highlightedBackground: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = defaultBackground
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        layer.removeAllAnimations()
        backgroundColor = highlightedBackground
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
            self.backgroundColor = self.defaultBackground
        })
    }

}
