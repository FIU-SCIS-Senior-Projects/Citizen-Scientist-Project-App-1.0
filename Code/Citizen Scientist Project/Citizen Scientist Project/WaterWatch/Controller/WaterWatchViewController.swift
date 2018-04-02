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
    
    @IBOutlet weak var waterWatchView: WaterWatchView!
    
    @IBOutlet public weak var collapsibleTableViewContainerHeight: NSLayoutConstraint!
    
    let waterWatchContent = WaterWatchContentManager.fetchContentData()
    
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
