//
//  MiniChallengeViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/29/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit
import StoreKit

class MiniChallengeViewController: UIViewController, SKStoreProductViewControllerDelegate {

    // Create a store product view controller.
    var storeProductViewController = SKStoreProductViewController()
    
    @IBOutlet weak var iNaturalistDownloadView: iNaturalistDownloadView!
    @IBOutlet weak var iNaturalistVimeoTutorialView: iNaturalistVimeoTutorialView!
   
    
    @IBAction func clickDownloadiNaturalistAppButton(_ sender: UIButton) {
        
//        // App Store URL.
//        let appStoreLink = "https://itunes.apple.com/us/app/inaturalist/id421397028?mt=8"
//
//        /* First create a URL, then check whether there is an installed app that can
//         open it on the device. */
//        if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
//            // Attempt to open the URL.
//            UIApplication.shared.open(url, options: [:], completionHandler: {(success: Bool) in
//                if success {
//                    print("Launching \(url) was successful")
//                }})
//        }
        
        // Create a product dictionary using the App Store's iTunes identifer.
        let parametersDict = [SKStoreProductParameterITunesItemIdentifier: 421397028]

        /* Attempt to load it, present the store product view controller if success
         and print an error message, otherwise. */
        storeProductViewController.loadProduct(withParameters: parametersDict, completionBlock: { (status: Bool, error: Error?) -> Void in
            if status {
                self.present(self.storeProductViewController, animated: true, completion: nil)
            }
            else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }}})
    }
    @IBAction func clickMakeAnObservationButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.inaturalist.org/projects/2017-18-mini-challenge-2")!, options: [:], completionHandler: nil)
    }
    @IBAction func clickRegisterOnlineButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.keyscience.org/projects/key-challenge/mini/")!, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeProductViewController.delegate = self
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
    // MARK: - iNaturalist Download Steps & Vimeo Tutorial Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showiNaturalistDownloadStepsPageVC{
            if let iNaturalistDownloadStepPageVC = segue.destination as? iNaturalistDownloadStepsPageViewController{
                // TODO: here you can assign the data to prepare for the PageViewController
                //iNaturalistDownloadStepPageVC.images = images
                iNaturalistDownloadStepPageVC.pageViewControllerDelegate = iNaturalistDownloadView
            }
        }
        
        if segue.identifier == Storyboard.showiNaturalistVimeoTutorialPageVC{
            if let iNaturalistVimeoTutorialPageVC = segue.destination as? iNaturalistVimeoTutorialsPageViewController{
                // TODO: here you can assign the data to prepare for the PageViewController
                //iNaturalistDownloadStepPageVC.images = images
                iNaturalistVimeoTutorialPageVC.pageViewControllerDelegate = iNaturalistVimeoTutorialView
            }
        }
        
    }
    
    // Let's dismiss the presented store product view controller.
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
