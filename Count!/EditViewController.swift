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
            navigationItem.title = "Edit Counter"
        }
        
        if let offsetTextField = offsetTextField {
            offsetTextField.text = "\(counter.getCount())"
        }
        
        if let titleTextField = titleTextField {
            titleTextField.text = counter.title
            saveButton.isEnabled = !(titleTextField.text?.isEmpty)!
        }
        
        colorize(with: counter.gradient)
    }
    
    private func colorize(with: Gradient) {
        if let colorName = colorName {
            colorName.text = with.label
        }
        
        if let colorPreview = colorPreview {
            colorPreview.gradient = with
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
        
        if let offset = Int(offsetTextField.text!) {
            counter.increment(value: offset)
        } else {
            counter.reset()
        }
        
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
            
            if let gradient = controller.selectedGradient {
                counter.gradient = gradient
                colorize(with: gradient)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickColor" {
            titleTextField.resignFirstResponder()
            offsetTextField.resignFirstResponder()
        }
    }
    
    // MARK: - Table View Styling
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
