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
            self.navigationItem.title = "Edit: \(counter?.title)"
        }
    }
    
    var isNew = true

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var colorPreview: UIView!
    
    @IBAction func cancelEdit(_ sender: AnyObject) {
        dismiss(animated: true) {
            self.counter = nil
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
                
                let gradient = CAGradientLayer()
                
                gradient.colors = [color.startColor.cgColor, color.endColor.cgColor]
                gradient.frame = colorPreview.bounds
                gradient.cornerRadius = 5
                
                colorPreview.layer.insertSublayer(gradient, at: 0)
            }
        }
    }

}
