//
//  MiniChallengeViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/29/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class MiniChallengeViewController: UIViewController {

    @IBOutlet weak var iNaturalistDownloadView: iNaturalistDownloadView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - iNaturalist Download Steps Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showiNaturalistDownloadStepsPageVC{
            if let iNaturalistDownloadStepPageVC = segue.destination as? iNaturalistDownloadStepsPageViewController{
                // TODO: here you can assign the data to prepare for the PageViewController
                //iNaturalistDownloadStepPageVC.images = images
                iNaturalistDownloadStepPageVC.pageViewControllerDelegate = iNaturalistDownloadView
            }
        }
    }
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor  = UIColor(red:0.08, green:0.09, blue:0.15, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.60, green:0.66, blue:0.70, alpha:1.0)
        
        let image : UIImage = UIImage(named: "csp-app-logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }

}
