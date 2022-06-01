//
//  SideMenuCell.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 2.06.2022.
//

import UIKit

class SideMenuCell: UITableViewCell {

        class var identifier: String { return String(describing: self) }
        class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
        
        @IBOutlet var titleLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            // Background
            self.backgroundColor = .clear
            
            // Title
            self.titleLabel.textColor = .white
        }
    
}
