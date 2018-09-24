//
//  BaseCollectionCell.swift
//  EarlGrayTestPresentation
//
//  Created by Babic Vojko on 9/21/18.
//  Copyright © 2018 CarnegieTechnologies. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var subviewsContainer: UIView!
    
    private func setLayout() {
        subviewsContainer?.layer.cornerRadius = 5.0
        
        subviewsContainer?.layer.borderColor = UIColor.lightGray.cgColor
        subviewsContainer?.layer.borderWidth = 0.5
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
