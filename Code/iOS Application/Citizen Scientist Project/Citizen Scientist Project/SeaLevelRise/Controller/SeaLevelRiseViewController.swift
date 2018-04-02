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
    
    // Prezi Presentation
    @IBAction func preziPresentationButtonPressed(_ sender: UIButton) {
        let page = "https://prezi.com/embed/cj5dj1zp9ujg/?bgcolor=ffffff&lock_to_path=0&autoplay=0&autohide_ctrls=0&landing_data=bHVZZmNaNDBIWnNjdEVENDRhZDFNZGNIUE43MHdLNWpsdFJLb2ZHanI5aEFub3ZObExNbWNaSVR1b1JYZGJMTVFBPT0&landing_sign=-Wwf32H6Hg-0vgwKlb7IbvFkJefHCjRWxICXzd2tyI0"
        openPage(scheme: "", page: page)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
    func displayFileResource(fileName: String, fileExtension: String)
    {
        resourceName = fileName
        resourceExtension = fileExtension
        
        performSegue(withIdentifier: segueId, sender: self)
    }
    
    
    // Footer Section
    @IBAction func openFacebook(_ sender: UIButton) {
        SocialNetwork.Facebook.openPage()
    }
    
    @IBAction func openTwitter(_ sender: UIButton) {
        SocialNetwork.Twitter.openPage()
    }
    
    @IBAction func openGooglePlus(_ sender: UIButton) {
        SocialNetwork.GooglePlus.openPage()
    }
    
    @IBAction func openYoutube(_ sender: UIButton) {
        SocialNetwork.YouTube.openPage()
    }
    
    @IBAction func openInstagram(_ sender: UIButton) {
        SocialNetwork.Instagram.openPage()
    }
    
    // TODO: This function should be reused instead
    func openPage(scheme: String, page: String) {
        let schemeUrl = NSURL(string: scheme)!
        if UIApplication.shared.canOpenURL(schemeUrl as URL) {
            UIApplication.shared.open(schemeUrl as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(NSURL(string: page)! as URL, options: [:], completionHandler: nil)
        }
    }
}
