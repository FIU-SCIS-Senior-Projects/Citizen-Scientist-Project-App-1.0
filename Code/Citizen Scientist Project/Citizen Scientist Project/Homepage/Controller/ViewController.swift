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
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cspLabExpanded = ContentManager.CSPLAB_CHILDREN_DEFAULT_VISIBILITY
    
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
        let count = cellContent.numberOfExpandedCells()
        return  count// Returns the number of visible cells
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
        
        let index = indexPath.row
        guard let cellCont = cellContent.nextAvailableCell(fromIndex: index) else {
            print("Unable to get the next available cell. Make sure there is no error in the data.")
            return cell
        }
        
        cell.setUp(content: cellCont, screenWidth: screenWidth)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = StoryBoard.cellBorderWidth
        
        return cell
    }
    
    
    // MARK: - Click Listener Event for a specific cell in the UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
            // Welcome cell does not take you anywhere
            case ContentManager.cellToIdMap[.News]!: Page.News.goTo(from: self)
            case ContentManager.cellToIdMap[.Events]!: Page.Events.goTo(from: self)
            case ContentManager.cellToIdMap[.KeyChallenge]!: Page.KeyChallenge.goTo(from: self)
            case ContentManager.cellToIdMap[.ReefRestoration]!: Page.ReefRestoration.goTo(from: self)
            case ContentManager.cellToIdMap[.CSPLab]!: expandCollapseCSPLab()
            case ContentManager.cellToIdMap[.Learn]!: Page.Learn.goTo(from: self)
            case ContentManager.cellToIdMap[.Explore]!: Page.Explore.goTo(from: self)
            case ContentManager.cellToIdMap[.Record]!: Page.Record.goTo(from: self)
            case ContentManager.cellToIdMap[.Review]!: Page.Review.goTo(from: self)
            case ContentManager.cellToIdMap[.WaterWatch]!: Page.WaterWatch.goTo(from: self)
            case ContentManager.cellToIdMap[.SeaLevelRise]!: Page.SeaLevelRise.goTo(from: self)
            case ContentManager.cellToIdMap[.LectureSeries]!: Page.LectureSeries.goTo(from: self)
            case ContentManager.cellToIdMap[.FieldActivities]!: Page.FieldActivities.goTo(from: self)
            case ContentManager.cellToIdMap[.OurPartners]!: Page.OurPartners.goTo(from: self)
            case ContentManager.cellToIdMap[.ContactUs]!: Page.ContactUs.goTo(from: self)
            default: print("Cell \(indexPath.row) clicked!")
        }
        
    }
    
    func expandCollapseCSPLab()
    {
        cspLabExpanded = !cspLabExpanded
        // Cells to be expanded/collapsed when CSPLab Cell is clicked
        // TODO: dynamically get the CSPLab children
        let indexPaths: [IndexPath] = [
            IndexPath(row: ContentManager.cellToIdMap[.Learn]!, section: 0),
            IndexPath(row: ContentManager.cellToIdMap[.Explore]!, section: 0),
            IndexPath(row: ContentManager.cellToIdMap[.Record]!, section: 0),
            IndexPath(row: ContentManager.cellToIdMap[.Review]!, section: 0),
            ]
        
        collectionView.performBatchUpdates({
            if cspLabExpanded {
                collectionView.insertItems(at: indexPaths)
            }else{
                collectionView.deleteItems(at: indexPaths)
            }
            
            
            let cspLabCellId = ContentManager.cellToIdMap[.CSPLab]
            cellContent[cspLabCellId!].expandableProperty.isExpanded = cspLabExpanded
            
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


