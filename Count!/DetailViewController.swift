//
//  DetailViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    func configureView() {
        if let detail = self.counter {
            navigationItem.title = detail.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    var counter: Counter? {
        didSet {
            self.configureView()
        }
    }
    
    @IBAction func editItem(_ sender: AnyObject) {
        performSegue(withIdentifier: "editItem", sender: nil)
    }
    
}

