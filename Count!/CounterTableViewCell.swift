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
    
    var counter: Counter? {
        didSet {
            if let currentCounter = counter {
                titleLabel.text = currentCounter.title
                countLabel.text = "\(currentCounter.getCounter())"
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
