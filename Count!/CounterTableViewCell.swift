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
    @IBOutlet weak var gradientView: GradientView!
    
    var counter: Counter? {
        didSet {
            if let counter = counter {
                titleLabel.text = counter.title
                countLabel.text = "\(counter.getCounter())"
                gradientView.color = counter.color
            }
        }
    }
    
    @IBAction func decrement(_ sender: AnyObject) {
        if let currentCounter = self.counter {
            currentCounter.decrement()
            countLabel.text = "\(currentCounter.getCounter())"
        }
    }
    
    @IBAction func increment(_ sender: AnyObject) {
        if let currentCounter = self.counter {
            currentCounter.increment()
            countLabel.text = "\(currentCounter.getCounter())"
        }
    }
    
}
