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
            isNew = false
            self.navigationItem.title = "Edit: \(counter?.title)"
        }
    }
    
    var isNew = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelEdit(_ sender: AnyObject) {
        dismiss(animated: true) {
            self.counter = nil
        }
    }

}
