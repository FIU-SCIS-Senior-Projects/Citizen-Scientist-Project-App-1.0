//
//  CollapsibleTableViewCell.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/22/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

import UIKit

class CollapsibleTableViewCell: UITableViewCell {
    
    let chartTitle = UILabel()
    let chartImageView = UIImageView()
    let legendImageView = UIImageView()
    
    // MARK: Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.backgroundColor = UIColor(hex: 0xF4F6F8)
        
        // configure chartTitle
        contentView.addSubview(chartTitle)
        chartTitle.translatesAutoresizingMaskIntoConstraints = false
        chartTitle.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        chartTitle.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8).isActive = true
        chartTitle.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        chartTitle.numberOfLines = 0
        chartTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        chartTitle.textAlignment = .center
        chartTitle.textColor = UIColor(hex: 0x3D394F)
        
        // configure chart image
        chartImageView.translatesAutoresizingMaskIntoConstraints = false
        chartImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20) // TODO: remove added line of code
        contentView.addSubview(chartImageView)
        chartImageView.translatesAutoresizingMaskIntoConstraints = false
        chartImageView.topAnchor.constraint(equalTo: chartTitle.bottomAnchor, constant: 0).isActive = true
        chartImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        //chartImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        chartImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        chartImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        // configure chart image
        contentView.addSubview(legendImageView)
        legendImageView.translatesAutoresizingMaskIntoConstraints = false
        legendImageView.topAnchor.constraint(equalTo: chartTitle.bottomAnchor).isActive = true
        legendImageView.leadingAnchor.constraint(equalTo: chartImageView.trailingAnchor).isActive = true
        legendImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        legendImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        legendImageView.contentMode = UIViewContentMode.scaleAspectFit
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

