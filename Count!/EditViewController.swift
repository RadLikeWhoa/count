//
//  EditViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

import UIKit

class EditViewController: UITableViewController {
    
    var counter: Counter? {
        didSet {
            if let counter = counter {
                if !isNew {
                    self.navigationItem.title = "Edit: \(counter.title)"
                }

                self.titleTextField.text = counter.title
                colorize(color: counter.color)
            }
        }
    }
    
    var isNew = true

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var colorPreview: UIView!
    @IBOutlet weak var colorName: UILabel!
    
    override func viewDidLoad() {
        if isNew {
            counter = Counter(title: "Untitled")
        }
    }
    
    @IBAction func cancelEdit(_ sender: AnyObject) {
        dismiss(animated: true) {
            self.counter = nil
        }
    }
    
    private func colorize(color: Color) {
        let gradient = CAGradientLayer()
        
        gradient.colors = [color.startColor.cgColor, color.endColor.cgColor]
        gradient.frame = colorPreview.bounds
        gradient.cornerRadius = 5
        
        colorName.text = color.label
        
        if colorPreview.layer.sublayers?[0] is CAGradientLayer {
            colorPreview.layer.replaceSublayer((colorPreview.layer.sublayers?[0])!, with: gradient)
        } else {
            colorPreview.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    @IBAction func saveCounter(_ sender: AnyObject) {
        if (isNew) {
            // counter = Counter.init(id: 0, title: titleTextField.text!, color: UIColor.red)
        } else {
            counter?.title = titleTextField.text!
        }
        
        performSegue(withIdentifier: "unwindToMaster", sender: self)
    }
    
    // MARK: - Segues
    
    @IBAction func unwindToEdit(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindToEdit" {
            let controller = segue.source as! ColorPickerTableViewController
            
            if let color = controller.selectedColor {
                if let counter = counter {
                    counter.color = color
                }
                
                colorize(color: color)
            }
        }
    }

}
