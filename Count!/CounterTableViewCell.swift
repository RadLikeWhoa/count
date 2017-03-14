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
    @IBOutlet weak var incrementer: CounterButton!
    @IBOutlet weak var decrementer: CounterButton!
    
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
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            UIView.animate(withDuration: 0.2, animations: {
                self.incrementer.alpha = 0
                self.decrementer.alpha = 0
            }) { completion in
                self.incrementer.isHidden = true
                self.decrementer.isHidden = true
            }
        } else {
            self.incrementer.isHidden = false
            self.decrementer.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.incrementer.alpha = 1
                self.decrementer.alpha = 1
            }
        }
    }
    
}
