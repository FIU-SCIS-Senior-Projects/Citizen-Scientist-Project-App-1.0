//
//  iNaturalistVimeoTutorialViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class iNaturalistVimeoTutorialViewController: UIViewController {

    @IBOutlet weak var vimeoTutorialView: UIImageView!
    @IBOutlet weak var vimeoTutorialTextView: UITextView!
    
    var image: UIImage? {
        didSet {
            self.vimeoTutorialView?.image = image
        }
    }
    
    var text: String? {
        didSet {
            self.vimeoTutorialTextView?.text = text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.vimeoTutorialView.image = image
        self.vimeoTutorialTextView.text = text
        
    }

}
