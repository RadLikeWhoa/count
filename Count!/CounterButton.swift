//
//  CounterButton.swift
//  Count!
//
//  Created by Sacha Schmid on 5.3.17.
//
//

import UIKit

class CounterButton: UIButton {
    
    // MARK: - Properties
    
    @IBInspectable var defaultBackground: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            backgroundColor = defaultBackground
        }
    }
    
    @IBInspectable var highlightedBackground: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
                self.backgroundColor = self.isHighlighted ? self.highlightedBackground : self.defaultBackground
            })
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = defaultBackground
        isExclusiveTouch = true
    }

}
