//
//  NewsViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/20/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }

}
