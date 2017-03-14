//
//  DetailViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let options = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    private let confirmReset = UIAlertController(title: "Reset Counter?", message: "Do you really want to reset your counter back to 0?", preferredStyle: .alert)
    private let confirmDelete = UIAlertController(title: "Delete Counter?", message: "Do you really want to delete your counter?", preferredStyle: .alert)
    
    private enum ButtonAction {
        case increment
        case decrement
    }
    
    var counter: Counter? {
        didSet {
            configureView()
        }
    }
    
    private var timer: Timer?
    private var interval: Double = 0.5
    
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var counterLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupOptions()
        setupReset()
        setupDelete()
    }
    
    // - MARK: Alerts
    
    private func setupOptions() {
        options.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        options.addAction(UIAlertAction(title: "Reset", style: .default, handler: { action in
            self.showResetConfirmation()
        }))
        
        options.addAction(UIAlertAction(title: "Edit", style: .default, handler: { action in
            self.performSegue(withIdentifier: "editItem", sender: nil)
        }))
        
        options.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
            self.showDeleteConfirmation()
        }))
    }
    
    private func setupReset() {
        confirmReset.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        confirmReset.addAction(UIAlertAction(title: "Reset", style: .destructive, handler: { action in
            if let counter = self.counter {
                counter.reset()
                self.counterLabel.text = "\(counter.getCount())"
            }
        }))
    }
    
    private func setupDelete() {
        confirmDelete.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        confirmDelete.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
            self.performSegue(withIdentifier: "deleteItem", sender: self)
        }))
    }
    
    // - MARK: View

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        if let counter = counter {
            navigationItem.title = counter.title
            
            if let gradientView = gradientView {
                gradientView.gradient = counter.gradient
            }
            
            if let counterLabel = counterLabel {
                counterLabel.text = "\(counter.getCount())"
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func showMore(_ sender: UIBarButtonItem) {
        present(options, animated: true, completion: nil)
    }
    
    private func showResetConfirmation() {
        if let counter = counter {
            confirmReset.title = "Do you really want to reset \"\(counter.title)\" back to 0?"
            present(confirmReset, animated: true, completion: nil)
        }
    }
    
    private func showDeleteConfirmation() {
        if let counter = counter {
            confirmDelete.title = "Do you really want to delete \"\(counter.title)\"?"
            present(confirmDelete, animated: true, completion: nil)
        }
    }
    
    // MARK: - Counter
    
    private func scheduleTimer(action: ButtonAction) {
        if interval > 0.2 {
            interval -= 0.1
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: {_ in
            self.modifyCount(action: action)
            self.scheduleTimer(action: action)
        })
    }
    
    private func modifyCount(action: ButtonAction) {
        if let counter = counter {
            if action == .increment {
                counter.increment()
            } else {
                counter.decrement()
            }
            
            if let counterLabel = counterLabel {
                counterLabel.text = "\(counter.getCount())"
            }
        }
    }
    
    // MARK: - Buttion Actions
    
    @IBAction func touchDown(_ sender: UIButton) {
        let action: ButtonAction = sender.tag == 1 ? .increment : .decrement
        
        modifyCount(action: action)
        scheduleTimer(action: action)
    }
    
    @IBAction func touchUp(_ sender: UIButton) {
        timer?.invalidate()
        interval = 0.5
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
            showResetConfirmation()
        }
    }
    
}

