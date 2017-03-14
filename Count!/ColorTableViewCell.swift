//
//  ColorTableViewCell.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var color: Color? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorPreview: GradientView!
    
    // MARK: - View
    
    private func configureView() {
        if let color = color {
            titleLabel.text = color.label
            colorPreview.color = color
        }
    }

}
