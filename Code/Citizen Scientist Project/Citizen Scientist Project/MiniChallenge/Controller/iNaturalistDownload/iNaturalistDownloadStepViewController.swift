//
//  DownloadiNaturalistViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class iNaturalistDownloadStepViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stepsTextView: UITextView!
    
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    
    var text: String? {
        didSet {
            self.stepsTextView?.text = text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
        self.stepsTextView.text = text
    }

}
