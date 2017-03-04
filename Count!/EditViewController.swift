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
            configureView()
        }
    }
    
    var isNew = true

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var offsetTextField: UITextField!
    @IBOutlet weak var colorPreview: GradientView!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        if isNew {
            counter = Counter()
        }
        
        configureView()
    }
    
    func configureView() {
        if let counter = counter {
            if !isNew {
                navigationItem.title = "Edit: \(counter.title)"
                
                if let offsetTextField = offsetTextField {
                    offsetTextField.text = "\(counter.getCounter())"
                    offsetTextField.isEnabled = false
                }
            }
            
            if let titleTextField = titleTextField {
                titleTextField.text = counter.title
                saveButton.isEnabled = !(titleTextField.text?.isEmpty)!
            }
            
            colorize(color: counter.color)
        }

    }
    
    @IBAction func cancelEdit(_ sender: AnyObject) {
        dismiss(animated: true)
    }
    
    private func colorize(color: Color) {
        if let colorName = colorName {
            colorName.text = color.label
        }
        
        if let colorPreview = colorPreview {
            colorPreview.color = color
        }
    }
    
    @IBAction func saveCounter(_ sender: AnyObject) {
        if self.isNew {
            counter?.title = titleTextField.text!
            counter?.increment(value: Int(offsetTextField.text!)!)
        } else {
            counter?.title = titleTextField.text!
        }
        
        performSegue(withIdentifier: "unwindToMaster", sender: self)
    }
    
    @IBAction func titleTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            saveButton.isEnabled = !text.isEmpty
        }
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
