//
//  ViewController.swift
//  My First Project
//
//  Created by David Gonzalez on 1/29/18.
//  Copyright © 2018 David Gonzalez. All rights reserved.
//

import UIKit

let RGB: CGFloat = 255.0
let fullOpacity: CGFloat = 1.0

//TODO: write comments
class ViewControllerDavid: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellContent: [CellContent] = ContentManager.fetchCellContent()
    var sectionFooter: [Icon] = SectionFooter.fetchIcons()
    
    struct StoryBoard {
        static let cellContentView = "Cell"
        static let sectionFooterView = "FooterView"
        
        static let numberOfSections = 1
        static let numberOfItemsPerRow: CGFloat = 2.0
        static let cellBorderWidth: CGFloat = 1.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return StoryBoard.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let index = indexPath.item
        let cellCont = cellContent[index]
        let screenWidth = self.collectionView.frame.size.width
        
        if cellCont.cellType == CellContent.CellType.Super {
            return CGSize(width: screenWidth, height: screenWidth/2) // full width
        }
        return CGSize(width: (screenWidth/2), height: screenWidth/2);
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.cellContentView, for: indexPath) as!  CollectionViewCell
        
        let screenWidth = self.collectionView.frame.size.width
        
        let index = indexPath.item
        let cellCont = cellContent[index]
        
        cell.setUp(content: cellCont, screenWidth: screenWidth)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = StoryBoard.cellBorderWidth

        
        return cell
    }
    
    
    // MARK: - Click Listener Event for a specific cell in the UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.item
        let cellCont = cellContent[index]
        
        let message = cellCont.labelHeader + " " + cellCont.labelSubHeader
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        
        // duration in seconds
        let duration: Double = 1.5
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
    
    // MARK: - Section Footer View
    
    
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
    
    
    
    // Setup footer icon images
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        let sectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryBoard.sectionFooterView, for: indexPath) as! SectionFooterView
        
        let icon = sectionFooter[indexPath.row]
        sectionFooterView.icon = icon
        
        return sectionFooterView
    }
    
    var menuShowing = false
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    
    @IBAction func toggleMenu(_ sender: Any) {
        
        if menuShowing{
            leadingConstraint.constant = -260
        } else {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
        }
        
        menuShowing = !menuShowing
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        if menuShowing{
            leadingConstraint.constant = -260
        } else {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
        }
        
        menuShowing = !menuShowing
        
    }
    
}


