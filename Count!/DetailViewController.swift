//
//  DetailViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit

class DetailViewController: UIViewController {
    
    var counter: Counter? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var counterLabel: UILabel!
    
    func configureView() {
        if let detail = counter {
            navigationItem.title = detail.title
            
            if let gradientView = gradientView {
                gradientView.color = detail.color
            }
            
            if let counterLabel = counterLabel {
                counterLabel.text = "\(detail.getCounter())"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @IBAction func editItem(_ sender: AnyObject) {
        performSegue(withIdentifier: "editItem", sender: nil)
    }
    
    @IBAction func increase(_ sender: UIButton) {
        if let counter = counter {
            counter.increment()
            
            if let counterLabel = counterLabel {
                counterLabel.text = "\(counter.getCounter())"
            }
        }
    }
    
    @IBAction func decrease(_ sender: UIButton) {
        if let counter = counter {
            counter.decrement()
            
            if let counterLabel = counterLabel {
                counterLabel.text = "\(counter.getCounter())"
            }
        }
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editItem" {
            let controller = (segue.destination as! UINavigationController).topViewController as! EditViewController
            controller.isNew = false
            controller.counter = counter!
        }
    }
    
    @IBAction func unwindToDetail(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindToDetail" {
            let controller = segue.source as! EditViewController
            counter = controller.counter
        }
    }
    
}

