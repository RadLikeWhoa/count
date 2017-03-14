//
//  EditViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 27.2.17.
//
//

import UIKit

class EditViewController: UITableViewController {
    
    // MARK: - Properties
    
    var counter: Counter = Counter() {
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
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextField.becomeFirstResponder()
    }
    
    private func configureView() {
        if !isNew {
            navigationItem.title = "Edit: \(counter.title)"
        }
        
        if let offsetTextField = offsetTextField {
            offsetTextField.text = "\(counter.getCount())"
        }
        
        if let titleTextField = titleTextField {
            titleTextField.text = counter.title
            saveButton.isEnabled = !(titleTextField.text?.isEmpty)!
        }
        
        colorize(color: counter.color)
    }
    
    private func colorize(color: Color) {
        if let colorName = colorName {
            colorName.text = color.label
        }
        
        if let colorPreview = colorPreview {
            colorPreview.color = color
        }
    }
    
    // MARK: - Actions
    
    @IBAction func cancelEdit(_ sender: AnyObject) {
        titleTextField.resignFirstResponder()
        offsetTextField.resignFirstResponder()
        
        dismiss(animated: true)
    }
    
    @IBAction func saveCounter(_ sender: AnyObject) {
        if !isNew {
            counter.reset()
        }
        
        counter.title = titleTextField.text!
        counter.increment(value: Int(offsetTextField.text!)!)
        
        titleTextField.resignFirstResponder()
        offsetTextField.resignFirstResponder()
        
        performSegue(withIdentifier: isNew ? "unwindToMaster" : "unwindToDetail", sender: self)
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
                counter.color = color
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
