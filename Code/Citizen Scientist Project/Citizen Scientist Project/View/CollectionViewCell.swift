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
    @IBOutlet weak var itemLabel1: UILabel!
    @IBOutlet weak var itemLabel2: UILabel!
    
    var imageName: String = "default" {
        didSet {
            itemImageView.image = UIImage(named: imageName)
        }
    }
    
    var headerLabel: String! {
        didSet {
            itemLabel1.text = headerLabel
        }
    }
    
    var subHeaderLabel: String! {
        didSet {
            itemLabel2.text = subHeaderLabel
        }
    }
    
    var imageSize: (width: CGFloat, height: CGFloat)! {
        didSet {
            itemImageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: imageSize.width, height: imageSize.height))
        }
    }
    
    func defaultSetup() {
        itemImageView.contentMode = UIViewContentMode.scaleAspectFill
        itemImageView.clipsToBounds = true
    }
    
    
}
