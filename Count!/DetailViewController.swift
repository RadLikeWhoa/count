//
//  DetailViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit

class DetailViewController: UIViewController {
    
    let options = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let confirmReset = UIAlertController(title: "Reset Counter?", message: "Do you really want to reset your counter back to 0?", preferredStyle: .alert)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        options.addAction(UIAlertAction(title: "Reset", style: .default, handler: { action in
            self.reset()
        }))
        
        options.addAction(UIAlertAction(title: "Edit", style: .default, handler: { action in
            self.performSegue(withIdentifier: "editItem", sender: nil)
        }))
        
        options.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
            self.performSegue(withIdentifier: "deleteItem", sender: self)
        }))
        
        options.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        confirmReset.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        confirmReset.addAction(UIAlertAction(title: "Reset", style: .destructive, handler: { action in
            if let counter = self.counter {
                counter.reset()
                self.counterLabel.text = "\(counter.getCounter())"
            }
        }))
    }
    
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
    
    @IBAction func showMore(_ sender: UIBarButtonItem) {
        present(options, animated: true, completion: nil)
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
    
    func reset() {
        if let counter = counter {
            confirmReset.title = "Do you really want to reset \"\(counter.title)\" back to 0?"
            present(confirmReset, animated: true, completion: nil)
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
    
    // MARK: - Motion
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            reset()
        }
    }
    
}

