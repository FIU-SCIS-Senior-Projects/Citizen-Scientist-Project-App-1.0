//
//  KeyChallengeViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol KeyChallengeViewControllerDelegate: class {
    func setContainerHeight(height: CGFloat)
}

class KeyChallengeViewController: UIViewController {

    @IBOutlet public weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KeyChallengeCollapsibleTableViewController.delegate = self
        
        if let keyChallengeCollapsibleTableViewController = self.childViewControllers.first as? KeyChallengeCollapsibleTableViewController {
            setContainerHeight(height: keyChallengeCollapsibleTableViewController.tableViewHeight)
        }

        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
    //MARK: - Handle Button Clicks
    
    @IBAction func clickDownloadKeyChallengeProgramButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.keyscience.org/wp-content/uploads/2017/02/kc-2017-brochure-FINAL-WEB.pdf")!, options: [:], completionHandler: nil)
    }
    @IBAction func clickIssuuPresentationButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://issuu.com/kbcf/docs/kc-2017-brochure-final-web")!, options: [:], completionHandler: nil)
    }
    @IBAction func clickLearnMoreRedButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.keyscience.org/projects/key-challenge/")!, options: [:], completionHandler: nil)
        
    }

}

extension KeyChallengeViewController: KeyChallengeViewControllerDelegate {
    // Set Container View height constraint to resize depending on its internal table collapsible state
    func setContainerHeight(height: CGFloat) {
        heightConstraint?.constant = height
    }
}
