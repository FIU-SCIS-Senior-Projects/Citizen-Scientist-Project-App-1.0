//
//  CollectionViewCellContent.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

struct CellContent{
    
    var imageName: String
    var labelHeader: String
    var labelSubHeader: String
    var cellType: CellType
    var labelsPropetries: CellLabelsProperties
    
    enum CellType {
        case Regular // half of full width
        case Super   // full width
    }
    
}

struct CellLabelsProperties {
    var labelHeaderProperty: LabelProperties?
    var labelSubHeaderProperty: LabelProperties?
    
    init()
    {
        
    }
}

struct LabelProperties {
    var font: UIFont?
    var color: UIColor?
    var alignment: NSTextAlignment?
    
    init()
    {
        
    }
}
