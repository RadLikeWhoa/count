//
//  CounterTableViewCell.swift
//  Count!
//
//  Created by Sacha Schmid on 28.2.17.
//
//

import UIKit

class CounterTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var counter: Counter? {
        didSet {
            configureView()
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var incrementer: CounterButton!
    @IBOutlet weak var decrementer: CounterButton!
    @IBOutlet weak var gradientView: GradientView!
    
    // MARK: - View
    
    private func configureView() {
        if let counter = counter {
            titleLabel.text = counter.title
            countLabel.text = "\(counter.getCount())"
            gradientView.gradient = counter.gradient
        }
    }
    
    // MARK: - Actions
    
    @IBAction func decrement(_ sender: UIButton) {
        if let counter = counter {
            counter.decrement()
            countLabel.text = "\(counter.getCount())"
        }
    }
    
    @IBAction func increment(_ sender: UIButton) {
        if let counter = counter {
            counter.increment()
            countLabel.text = "\(counter.getCount())"
        }
    }
    
    // MARK: - Events
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        UIView.animate(withDuration: 0.2) {
            self.incrementer.alpha = editing ? 0 : 1
            self.decrementer.alpha = editing ? 0 : 1
        }
    }
    
}
