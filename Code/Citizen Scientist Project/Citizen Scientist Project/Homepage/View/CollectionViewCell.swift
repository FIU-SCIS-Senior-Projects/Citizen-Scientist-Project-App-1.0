//
//  CollectionViewCell.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/8/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var subHeaderLabel: UILabel!
    
    @IBOutlet private weak var labelsStackContainer: UIStackView!
    
    @IBOutlet private weak var leftMarginLabelsConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomMarginLabelsConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var subHeaderLabelHeightConstraint: NSLayoutConstraint!
    
    static let leftMarginPercentage:  CGFloat = 5.0
    static let bottomMarginPercentage: CGFloat = leftMarginPercentage * 2
    static let inBetweenLabelSpacing: CGFloat = 5.0
    static let noInBetweenLabelSpacing: CGFloat = 0.0
    
    
    func setUp(content: CellContent, screenWidth: CGFloat)
    {
        
        // Populate cell with content
        imageView.image = UIImage(named: content.imageName)
        headerLabel.text = content.labelHeader
        subHeaderLabel.text = content.labelSubHeader
        
        // Setup some default properties to image view
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        // Setup label properties
        let properties = content.labelsPropetries
        setUpLabelProperties(properties: properties)
        
        // Setup cell image dimensions
        setUpImageViewFrame(cellType: content.cellType, screenWidth: screenWidth)
        
        
        // Setup cell labels position and constraints
        setUpLabelsConstrainsts(cellType: content.cellType, screenWidth: screenWidth)
        
    }
    
    private func setUpLabelProperties(properties: CellLabelsProperties)
    {
        // Header Label
        headerLabel.font = properties.labelHeaderProperty?.font
        headerLabel.textColor = properties.labelHeaderProperty?.color
        headerLabel.textAlignment = (properties.labelHeaderProperty?.alignment)!
        
        
        // Subheader Label
        subHeaderLabel.font = properties.labelSubHeaderProperty?.font
        subHeaderLabel.textColor = properties.labelSubHeaderProperty?.color
        subHeaderLabel.textAlignment = (properties.labelSubHeaderProperty?.alignment)!
    }
    
    private func setUpImageViewFrame(cellType: CellContent.CellType, screenWidth: CGFloat)
    {
        let cellHeight = screenWidth / 2.0
        let regularCellWidth = cellHeight
        
        if cellType == CellContent.CellType.Super
        {
            imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: screenWidth, height: cellHeight))
        }
        else if cellType == CellContent.CellType.Regular
        {
            imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: regularCellWidth, height: cellHeight))
        }
        else
        {
            // opps... internal error occurred!
        }
    }
    
    private func setUpLabelsConstrainsts(cellType: CellContent.CellType, screenWidth: CGFloat)
    {
        let regularCellWidth = screenWidth / 2
        let cellHeight = regularCellWidth
        
        let leftMargin = regularCellWidth * CollectionViewCell.leftMarginPercentage / 100.0
        let bottomMagin = cellHeight * CollectionViewCell.bottomMarginPercentage / 100.0
        
        
        if cellType == CellContent.CellType.Super
        {
            // Here the height of the stacks is equal to the sum of the height of both labels and the spacing between the labels
            let stackHeight = CollectionViewCell.inBetweenLabelSpacing + ContentManager.headerLabelFontSizeSuperCell + ContentManager.subHeaderLabelFontSizeSuperCell
            
            // Stack constraints
            leftMarginLabelsConstraint.constant = 0
            bottomMarginLabelsConstraint.constant = -(cellHeight - stackHeight)/2
            
            // Setup height of labels using a constraints
            headerLabelHeightConstraint.constant = ContentManager.headerLabelFontSizeSuperCell
            subHeaderLabelHeightConstraint.constant = ContentManager.subHeaderLabelFontSizeSuperCell
            
            // Space between labels of super cell
            labelsStackContainer.spacing = CollectionViewCell.inBetweenLabelSpacing
            
        }
        else if cellType == CellContent.CellType.Regular
        {
            // Stack constraints
            leftMarginLabelsConstraint.constant = leftMargin
            bottomMarginLabelsConstraint.constant = -bottomMagin
            
            // Setup height of labels using a constraints
            headerLabelHeightConstraint.constant = ContentManager.headerLabelFontSizeRegularCell
            subHeaderLabelHeightConstraint.constant = ContentManager.subHeaderLabelFontSizeRegularCell
            
            // Space between labels of regular cell
            labelsStackContainer.spacing = CollectionViewCell.noInBetweenLabelSpacing
            
        }
        else
        {
            // opps... internal error occurred!
        }
    }
    
}
