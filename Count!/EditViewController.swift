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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelEdit(_ sender: AnyObject) {
        dismiss(animated: true) {
            self.counter = nil
        }
    }
    
    @IBAction func saveCounter(_ sender: AnyObject) {
        if (isNew) {
            counter = Counter.init(id: 0, title: titleTextField.text!)
        } else {
            counter?.title = titleTextField.text!
        }
        
        performSegue(withIdentifier: "unwindToMaster", sender: self)
    }

}
