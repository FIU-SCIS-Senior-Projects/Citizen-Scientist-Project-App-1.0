//
//  WaterWatchViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol WaterWatchContainerViewDelegate: class {
    func setContainerHeight(height: CGFloat)
}

//TODO: create an extension with implementation
class WaterWatchViewController: UIViewController, WaterWatchContainerViewDelegate {
    
    let waterWatchContent = WaterWatchContentManager.fetchContentData()
    
    @IBOutlet weak var waterWatchView: WaterWatchView!
    
    @IBAction func clickLearnMoreButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.learnMore.url, options: [:], completionHandler: nil)
    }
    @IBAction func clickDissolvedOxygenButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.dissolvedOxygen.url, options: [:], completionHandler: nil)
    }
    @IBAction func clickNutrientsButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.nutrients.url, options: [:], completionHandler: nil)
    }
    @IBAction func clickChlorophyllButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.chlorophyllA.url, options: [:], completionHandler: nil)
    }
    
    
    @IBOutlet public weak var collapsibleTableViewContainerHeight: NSLayoutConstraint!
    
    //TODO: create an extension with implementation
    // Set Container View height constraint to resize depending on its internal table collapsible state
    func setContainerHeight(height: CGFloat) {
        collapsibleTableViewContainerHeight.constant = height
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let collapsibleTableViewController = self.childViewControllers.first as? CollapsibleTableViewController {
            setContainerHeight(height: collapsibleTableViewController.tableViewHeight)
        }
        
        CollapsibleTableViewController.delegate = self

        
//        let storyboard = UIStoryboard(name: "ChecklistDetail", bundle: nil)
//        let aVC = storyboard.instantiateViewController(withIdentifier: "ChecklistDetailViewController") as? ChecklistDetailViewController
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        
        waterWatchView.setUp(content: waterWatchContent)
        
        
        
        // Reference to WaterWatchView class
        //let waterWatchView = Bundle.main.loadNibNamed("WaterWatchView", owner: self, options: nil)![0] as? WaterWatchView
       
        // Pass data model to be loaded in WaterWatchView
//        waterWatchView?.setUp(content: waterWatchContent)
        
        
        //let vc = storyboard?.instantiateViewControllerWithIdentifier("test") as! UIViewController
        //self
        //container.addSubview(vc.view)
    }

}
