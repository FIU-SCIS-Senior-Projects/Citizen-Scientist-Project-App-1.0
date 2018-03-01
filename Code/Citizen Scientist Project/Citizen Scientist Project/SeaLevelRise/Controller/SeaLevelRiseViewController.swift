//
//  SeaLevelRiseViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class SeaLevelRiseViewController: UIViewController {

    let segueId = "goToWebView"
    let PDF = "pdf"
    
    @IBAction func surveyResultsButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Survey-Results-2-6-2017", fileExtension: PDF)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavBar()
    }
    
    func displayFileResource(fileName: String, fileExtension: String)
    {
        resourceName = fileName
        resourceExtension = fileExtension
        
        performSegue(withIdentifier: segueId, sender: self)
    }
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor(red:0.08, green:0.09, blue:0.15, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.60, green:0.66, blue:0.70, alpha:1.0)
        
        let image : UIImage = UIImage(named: "0-csp-app-logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
}
