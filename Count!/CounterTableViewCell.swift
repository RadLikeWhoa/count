//
//  CounterTableViewCell.swift
//  Count!
//
//  Created by Sacha Schmid on 28.2.17.
//
//

import UIKit

class CounterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override open class var layerClass: AnyClass {
        get{
            return CAGradientLayer.classForCoder()
        }
    }
    
    var counter: Counter? {
        didSet {
            if let counter = counter {
                titleLabel.text = counter.title
                countLabel.text = "\(counter.getCounter())"
                
                let gradientLayer = layer as! CAGradientLayer
                gradientLayer.colors = [counter.color.startColor.cgColor, counter.color.endColor.cgColor]
            }
        }
    }
    
    @IBAction func decrement(_ sender: UIButton) {
        if let counter = counter {
            counter.decrement()
            countLabel.text = "\(counter.getCounter())"
        }
    }
    
    @IBAction func increment(_ sender: UIButton) {
        if let counter = counter {
            counter.increment()
            countLabel.text = "\(counter.getCounter())"
        }
    }
    
}
