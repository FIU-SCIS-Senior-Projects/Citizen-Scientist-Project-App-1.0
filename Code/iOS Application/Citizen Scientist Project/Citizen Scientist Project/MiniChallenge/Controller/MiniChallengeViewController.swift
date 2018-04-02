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
    @IBOutlet weak var iNaturalistVimeoTutorialView: iNaturalistVimeoTutorialView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
