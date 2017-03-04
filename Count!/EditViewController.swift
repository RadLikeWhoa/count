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
    @IBOutlet weak var offsetTextField: UITextField!
    @IBOutlet weak var colorPreview: GradientView!
    @IBOutlet weak var colorName: UILabel!
    
    override func viewDidLoad() {
        if self.isNew {
            self.counter = Counter(title: "Untitled")
        }
    }
    
    @IBAction func cancelEdit(_ sender: AnyObject) {
        dismiss(animated: true)
    }
    
    private func colorize(color: Color) {
        colorName.text = color.label
        colorPreview.color = color
    }
    
    @IBAction func saveCounter(_ sender: AnyObject) {
        if self.isNew {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickColor" {
            titleTextField.resignFirstResponder()
            offsetTextField.resignFirstResponder()
        }
    }

}
