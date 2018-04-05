//
//  KeyChallengeViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class KeyChallengeViewController: UIViewController {

    @IBAction func clickDownloadKeyChallengeProgramButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.keyscience.org/wp-content/uploads/2017/02/kc-2017-brochure-FINAL-WEB.pdf")!, options: [:], completionHandler: nil)
    }
    @IBAction func clickIssuuPresentationButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://issuu.com/kbcf/docs/kc-2017-brochure-final-web")!, options: [:], completionHandler: nil)
    }
    @IBAction func clickLearnMoreRedButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.keyscience.org/projects/key-challenge/")!, options: [:], completionHandler: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }

}
