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
    private let confirmReset = UIAlertController(title: "Reset Counter", message: nil, preferredStyle: .alert)
    
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
    }
    
    // - MARK: Alerts
    
    private func setupOptions() {
        options.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        options.addAction(UIAlertAction(title: "Reset", style: .default, handler: { action in
            if let counter = self.counter {
                counter.reset()
                self.counterLabel.text = "\(counter.getCount())"
            }
        }))
        
        options.addAction(UIAlertAction(title: "Edit", style: .default, handler: { action in
            self.performSegue(withIdentifier: "editItem", sender: nil)
        }))
        
        options.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
            self.performSegue(withIdentifier: "deleteItem", sender: self)
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
    
    // - MARK: View

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !UserDefaults.standard.bool(forKey: "helpViewed") {
            showOverlay()
        }
    }
    
    private func configureView() {
        guard let counter = counter else {
            return
        }
        
        navigationItem.title = counter.title
        
        if let gradientView = gradientView {
            gradientView.gradient = counter.gradient
        }
        
        if let counterLabel = counterLabel {
            counterLabel.text = "\(counter.getCount())"
        }
    }

    private func showOverlay() {
        guard let window = UIApplication.shared.windows.last else {
            return
        }
        
        let view = UIImageView(frame: window.bounds)
        view.image = UIImage(named: window.bounds.height > 666 ? "intro" : "intro-alt")
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailViewController.closeOverlay)))
        view.isUserInteractionEnabled = true
        view.alpha = 0
        
        window.addSubview(view)
        
        UIView.animate(withDuration: 0.2) {
            view.alpha = 1
        }
    }
    
    @objc private func closeOverlay(sender: UITapGestureRecognizer) {
        let view = sender.view as! UIImageView
        
        UIView.animate(withDuration: 0.2, animations: {
            view.alpha = 0
        }, completion: { complete in
            view.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: "helpViewed")
        })
    }
    
    // MARK: - Actions
    
    @IBAction func showMore(_ sender: UIBarButtonItem) {
        present(options, animated: true, completion: nil)
    }
    
    // MARK: - Counter
    
    private func scheduleTimer(action: ButtonAction) {
        if interval > 0.1 {
            interval -= 0.05
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: {_ in
            self.modifyCount(action: action)
            self.scheduleTimer(action: action)
        })
    }
    
    private func modifyCount(action: ButtonAction) {
        guard let counter = counter else {
            return
        }
        
        if action == .increment {
            counter.increment()
        } else {
            counter.decrement()
        }
            
        if let counterLabel = counterLabel {
            counterLabel.text = "\(counter.getCount())"
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
            present(confirmReset, animated: true, completion: nil)
        }
    }
    
}

