//
//  ColorTableViewCell.swift
//  Count!
//
//  Created by Rinesch on 03.03.17.
//
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    var color: Color? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorPreview: UIView!
    
    func configureView() {
        if let color = self.color {
            self.titleLabel.text = color.label
            
            let gradient = CAGradientLayer()
                
            gradient.colors = [color.startColor.cgColor, color.endColor.cgColor]
            gradient.frame = self.colorPreview.bounds
            gradient.cornerRadius = 5
                
            self.colorPreview.layer.insertSublayer(gradient, at: 0)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
