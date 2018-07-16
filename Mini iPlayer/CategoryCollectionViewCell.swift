//
//  CategoryCollectionViewCell.swift
//  Mini iPlayer
//
//  Created by William Robinson on 12/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var label: UILabel!
    
    func configure(with text: String) {
        label.text = text
    }
}
