//
//  ColorPickerTableViewController.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit

class ColorPickerTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var selectedColor: Color?
    
    private let availableColors: [Color] = Color.availableColors
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableColors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorTableViewCell
        
        cell.color = availableColors[indexPath.row]
        
        return cell
    }
    
    // MARK: - Table View Events
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedColor = availableColors[indexPath.row]
        return indexPath
    }
    
    // MARK: - Table View Styling
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

}
