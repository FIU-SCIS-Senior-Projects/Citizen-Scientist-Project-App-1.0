//
//  SectionFooterView.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

//TODO: bind

class SectionFooterView: UICollectionReusableView {
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var googlePlusButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    
    var icon: Icon! {
        didSet {
            if let iconImage = UIImage(named: icon.sourceName){
                switch icon.type {
                case .Facebook:
                    facebookButton.setImage(iconImage, for: .normal)
                case .Twitter:
                    twitterButton.setImage(iconImage, for: .normal)
                case .GooglePlus:
                    googlePlusButton.setImage(iconImage, for: .normal)
                case .Youtube:
                    youtubeButton.setImage(iconImage, for: .normal)
                case .Instagram:
                    instagramButton.setImage(iconImage, for: .normal)
                }
            }
        }
    }
    
}
