//
//  AboutUsViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBAction func clickLabFullSiteButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.keyscience.org")!, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }

}
