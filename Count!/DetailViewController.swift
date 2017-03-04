//
//  DetailViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit

class DetailViewController: UIViewController {
    
    var counter: Counter? {
        didSet {
            self.configureView()
        }
    }
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    func configureView() {
        if let detail = counter {
            navigationItem.title = detail.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @IBAction func editItem(_ sender: AnyObject) {
        performSegue(withIdentifier: "editItem", sender: nil)
    }
    
}

