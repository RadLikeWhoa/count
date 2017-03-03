//
//  ColorPickerTableViewController.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit

class ColorPickerTableViewController: UITableViewController {
    
    var selectedColor: Color?
    
    let availableColors: [Color] = [
        Color(label: "Sha La La", startColor: UIColor(red: 0.886, green: 0.584, blue: 0.529, alpha: 1.00), endColor: UIColor(red: 0.839, green: 0.427, blue: 0.459, alpha: 1.00)),
        Color(label: "Under The Lake", startColor: UIColor(red: 0.137, green: 0.478, blue: 0.341, alpha: 1.00), endColor: UIColor(red: 0.035, green: 0.188, blue: 0.157, alpha: 1.00)),
        Color(label: "Solid Vault", startColor: UIColor(red: 0.227, green: 0.482, blue: 0.835, alpha: 1.00), endColor: UIColor(red: 0.227, green: 0.376, blue: 0.451, alpha: 1.00))
    ]
    
    // MARK: - Table view events
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedColor = availableColors[indexPath.row]
        return indexPath
    }

    // MARK: - Table view data source

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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

}
