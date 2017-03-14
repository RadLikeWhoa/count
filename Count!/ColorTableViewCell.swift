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
    
    var gradient: Gradient? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorPreview: GradientView!
    
    // MARK: - View
    
    private func configureView() {
        if let gradient = gradient {
            titleLabel.text = gradient.label
            colorPreview.gradient = gradient
        }
    }

}
