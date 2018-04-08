//
//  iNaturalistVimeoTutorialViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class iNaturalistVimeoTutorialViewController: UIViewController {

    @IBOutlet weak var vimeoTutorialButton: UIButton!
    @IBOutlet weak var vimeoTutorialTextView: UITextView!
    private var vimeoLink: URL?
    
    var image: UIImage? {
        didSet {
            self.vimeoTutorialButton?.setImage(image, for: .normal)
        }
    }
    
    var text: String? {
        didSet {
            self.vimeoTutorialTextView?.text = text
        }
    }
    
    var link: URL? {
        didSet {
            self.vimeoLink = link
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.vimeoTutorialButton?.setImage(image, for: .normal)
        vimeoTutorialButton.addTarget(self, action: #selector(handleOnVimeoClick), for: .touchUpInside)
        self.vimeoTutorialTextView?.text = text
        
    }
    
    @objc private func handleOnVimeoClick(){
        UIApplication.shared.open(vimeoLink!, options: [:], completionHandler: nil)
    }

}
