//
//  CollectionViewCell.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/8/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    var imageName: String! {
        didSet {
            itemImageView.image = UIImage(named: imageName)
        }
    }
    
    @IBOutlet weak var itemLabel1: UILabel!
    @IBOutlet weak var itemLabel2: UILabel!
}
