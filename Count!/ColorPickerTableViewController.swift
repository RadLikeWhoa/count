//
//  ColorPickerTableViewController.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit
import RealmSwift

class ColorPickerTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var selectedGradient: Gradient?
    
    private let realm = try! Realm()
    private lazy var availableGradients: Results<Gradient> = { self.realm.objects(Gradient.self) }()
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableGradients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorTableViewCell
        
        cell.gradient = availableGradients[indexPath.row]
        
        return cell
    }
    
    // MARK: - Table View Events
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedGradient = availableGradients[indexPath.row]
        return indexPath
    }
    
    // MARK: - Table View Styling
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

}
