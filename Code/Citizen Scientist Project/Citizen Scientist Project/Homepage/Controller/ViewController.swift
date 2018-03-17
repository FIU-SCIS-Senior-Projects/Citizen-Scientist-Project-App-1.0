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


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellContent: [HomepageCell] = ContentManager.fetchCellContent()
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

        collectionView.dataSource = self
        collectionView.delegate = self
        setUpNavBar()
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
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return StoryBoard.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  cellContent.numberOfExpandedCells() // Returns the number of visible cells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let index = indexPath.item
        let cellCont = cellContent[index]
        let screenWidth = self.collectionView.frame.size.width
        
        if cellCont.cellType == HomepageCell.CellType.Super {
            return CGSize(width: screenWidth, height: screenWidth/2) // full width
        }
        return CGSize(width: (screenWidth/2), height: screenWidth/2);
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.cellContentView, for: indexPath) as!  CollectionViewCell
        
        let screenWidth = self.collectionView.frame.size.width
        
        let index = indexPath.row
        let cellCont = cellContent.nextAvailableCell(fromIndex: index)
        
        cell.setUp(content: cellCont, screenWidth: screenWidth)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = StoryBoard.cellBorderWidth
        
        return cell
    }
    
    
    // MARK: - Click Listener Event for a specific cell in the UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
            case ContentManager.getPageId(page: .Home): Page.AboutUs.goTo(from: self)
            case ContentManager.getPageId(page: .News): Page.News.goTo(from: self)
            case ContentManager.getPageId(page: .Events): Page.Events.goTo(from: self)
            case ContentManager.getPageId(page: .KeyChallenge): Page.KeyChallenge.goTo(from: self)
            case ContentManager.getPageId(page: .ReefRestoration): Page.ReefRestoration.goTo(from: self)
            case ContentManager.getPageId(page: .CSPLab): expandCollapseCSPLab()
            case ContentManager.getPageId(page: .Learn): Page.Learn.goTo(from: self)
            case ContentManager.getPageId(page: .Explore): Page.Explore.goTo(from: self)
            case ContentManager.getPageId(page: .Record): Page.Record.goTo(from: self)
            case ContentManager.getPageId(page: .Review): Page.Review.goTo(from: self)
            case ContentManager.getPageId(page: .WaterWatch): Page.WaterWatch.goTo(from: self)
            case ContentManager.getPageId(page: .SeaLevelRise): Page.SeaLevelRise.goTo(from: self)
            case ContentManager.getPageId(page: .LectureSeries): Page.LectureSeries.goTo(from: self)
            case ContentManager.getPageId(page: .FieldActivities): Page.FieldActivities.goTo(from: self)
            case ContentManager.getPageId(page: .OurPartners): Page.OurPartners.goTo(from: self)
            case ContentManager.getPageId(page: .ContactUs): Page.ContactUs.goTo(from: self)
            default: print("Cell \(indexPath.row) clicked!")
        }
        
    }
    
    private func expandCollapseCSPLab()
    {
        // Change CSP Lab expandable property to its opposite
        cspLabExpanded = !cspLabExpanded
        
        // Cells to be expanded/collapsed when CSPLab Cell is clicked
        var indexPaths = [IndexPath]()
        let cspLabChildren = ContentManager.getPageChildren(page: .CSPLab) // dynamically get the CSPLab children
        for page in cspLabChildren {
            indexPaths.append(IndexPath(row: ContentManager.getPageId(page: page), section: 0))
        }
        
        collectionView.performBatchUpdates({
            if cspLabExpanded {
                collectionView.insertItems(at: indexPaths)
                
                // Updates the arrow image to 'up' when CSP Lab children are 'expanded'
                ContentManager.arrowImageName = ContentManager.UP_ARROW_IMAGE_NAME
                
            }else{
                collectionView.deleteItems(at: indexPaths)
                
                // Updates the arrow image to 'down' when CSP Lab children are 'hidden'
                ContentManager.arrowImageName = ContentManager.DOWN_ARROW_IMAGE_NAME
                
            }
            
            // This forces the CSP Lab cell to load before other cells. Arrow change animation speed is significantly increased
            let cspLabIndexPath = IndexPath(row: ContentManager.getPageId(page: .CSPLab), section: 0)
            self.collectionView.reloadItems(at: [cspLabIndexPath])
            
            // Updates CSP Lab expandable property
            let cspLabCellId = ContentManager.getPageId(page: .CSPLab)
            cellContent[cspLabCellId].expandableProperty?.isExpanded = cspLabExpanded
            
        }, completion: { (true) in
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
        })
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
    
}


