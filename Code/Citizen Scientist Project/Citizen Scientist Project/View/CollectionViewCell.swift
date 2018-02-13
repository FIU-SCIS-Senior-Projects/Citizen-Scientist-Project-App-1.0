//
//  CollectionViewCell.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/8/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    
    var content: CellContent! {
        didSet {
            imageView.image = UIImage(named: content.imageName)
            headerLabel.text = content.labelHeader
            subHeaderLabel.text = content.labelSubHeader
            
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            
            // Set up labels' properties
            let properties = content.labelsPropetries
            
            headerLabel.font = properties.labelHeaderProperty?.font
            headerLabel.textColor = properties.labelHeaderProperty?.color
            headerLabel.textAlignment = (properties.labelHeaderProperty?.alignment)!
            
            subHeaderLabel.font = properties.labelSubHeaderProperty?.font
            subHeaderLabel.textColor = properties.labelSubHeaderProperty?.color
            subHeaderLabel.textAlignment = (properties.labelSubHeaderProperty?.alignment)!
            
        }
    }
    
    var imageSize: (width: CGFloat, height: CGFloat)! {
        didSet {
            imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: imageSize.width, height: imageSize.height))
        }
    }
    
    
}
