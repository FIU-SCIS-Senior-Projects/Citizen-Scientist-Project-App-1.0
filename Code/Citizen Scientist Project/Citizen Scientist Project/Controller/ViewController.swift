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
    
    var sectionFooter: [Icon] = SectionFooter.fetchIcons()
    
    struct MainStoryBoard {
        static let cellContentView = "Cell"
        static let sectionFooterView = "FooterHomeView"
    }
    
    private let leftMargin = 15
    private let label1Height: CGFloat = 15
    private let label2Height: CGFloat = 25
    private let globalLightBlue = UIColor(displayP3Red: 95/255.0, green: 172/255.0, blue: 223/255.0, alpha: fullOpacity)
    private let label1YPosition = 140
    private let label2YPosition = 152
    private let normalCellLabel1FontSize: CGFloat = 8
    private let normalCellLabel2FontSize: CGFloat = 16
    private let superCellLabel1FontSize: CGFloat = 14
    private let superCellLabel2FontSize: CGFloat = 20
    private let superCellHeightBetweenLabels: CGFloat = 20
    private let screenWidthMinusActualWidth = 2.5
    
    private var showCSPLabChildren = false
    
    let allCellItem = [
        ["Welcome to the","CITIZEN SCIENTIST PROJECT"], // 1
        ["CITIZEN SCIENTIST PROJECT","LOCAL NEWS"], // 2
        ["CITIZEN SCIENTIST PROJECT","EVENTS"], // 3
        ["CSP 2017-18","KEY CHALLENGE"], // 4
        ["KEY BISCAYNE","REEF RESTORATION"], // 5
        ["Welcome to the","CSP LAB"], // 6
        ["CSP LAB","LEARN"], // 6.1
        ["CSP LAB","EXPLORE"], // 6.2
        ["CSP LAB","RECORD"], // 6.3
        ["CSP LAB","REVIEW"], // 6.4
        ["KEY BISCAYNE","WATER WATCH"], // 7
        ["KEY BISCAYNE","SEA LEVEL RISE"], // 8
        ["CITIZEN SCIENTIST PROJECT","LECTURE SERIES"], // 9
        ["CITIZEN SCIENTIST PROJECT","FIELD ACTIVITIES"], // 10
        ["CITIZEN SCIENTIST PROJECT","OUR PARTNERS"], // 11
        ["CITIZEN SCIENTIST PROJECT","CONTACT US"], // 12
    ]
    
    let allCellItemImage: [UIImage] = [
        UIImage(named: "1-welcome-home")!,
        UIImage(named: "2-news-home")!,
        UIImage(named: "3-events-home")!,
        UIImage(named: "4-key-challenge-home")!,
        UIImage(named: "5-reef-restoration-home")!,
        UIImage(named: "6-lab-home")!,
        UIImage(named: "7-lab-learn")!,
        UIImage(named: "8-lab-explore")!,
        UIImage(named: "9-lab-record")!,
        UIImage(named: "10-lab-review")!,
        UIImage(named: "11-water-watch-home")!,
        UIImage(named: "12-sea-level-home")!,
        UIImage(named: "13-lectures-home")!,
        UIImage(named: "14-field-activities-home")!,
        UIImage(named: "15-partners-home")!,
        UIImage(named: "16-contact-home")!,
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCellItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = self.collectionView.frame.size.width
        //let screenHeight = self.collectionView.frame.size.height
        if indexPath.row == 0 || indexPath.row == 5
        {
            return CGSize(width: screenWidth-5, height: screenWidth/2)
        }
        return CGSize(width: (screenWidth/2)-3, height: screenWidth/2);
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainStoryBoard.cellContentView, for: indexPath) as!  CollectionViewCell
        
        cell.itemImageView.image = allCellItemImage[indexPath.item]
        cell.itemImageView.contentMode = UIViewContentMode.scaleAspectFill
        cell.itemImageView.clipsToBounds = true
        
        let screenWidth = self.collectionView.frame.size.width
        
        if indexPath.row == 0 || indexPath.row == 5 // TODO: unhardcode numbers
        {
            cell.itemImageView.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: screenWidth-5, height: screenWidth/2)) // TODO: unhardcode numbers
            
            let superCellLabel1Height = label1Height * 2
            let verticalCenter = screenWidth/2/2 - superCellLabel1Height
            
            cell.itemLabel1.frame = CGRect(origin: CGPoint(x: 0,y :verticalCenter), size: CGSize(width: screenWidth, height: superCellLabel1Height))
            cell.itemLabel1.textAlignment = NSTextAlignment.center
            //cell.itemLabel1.font = UIFont(name: cell.itemLabel1.font.fontName , size: superCellLabel1FontSize) // TODO: maybe change the font?
            cell.itemLabel1.font = UIFont.italicSystemFont(ofSize: superCellLabel1FontSize)
            cell.itemLabel1.textColor = UIColor.white
            
            cell.itemLabel2.frame = CGRect(origin: CGPoint(x: 0,y :verticalCenter + superCellHeightBetweenLabels), size: CGSize(width: screenWidth, height: label2Height + label1Height))
            cell.itemLabel2.textAlignment = NSTextAlignment.center
            cell.itemLabel2.font = UIFont(name: cell.itemLabel2.font.fontName , size: superCellLabel2FontSize)
        }
        else{
            cell.itemImageView.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: (screenWidth/2)-3, height: screenWidth/2)) // TODO: unhardcode numbers
            
            let calculatedWidth = (screenWidth/2) - (CGFloat)(leftMargin) - (CGFloat)(screenWidthMinusActualWidth)
            cell.itemLabel1.frame = CGRect(origin: CGPoint(x: leftMargin,y :label1YPosition),
                                           size: CGSize(width: calculatedWidth, height: label1Height))
            cell.itemLabel1.font = UIFont.boldSystemFont(ofSize: normalCellLabel1FontSize)
            cell.itemLabel1.textColor = globalLightBlue
            cell.itemLabel1.font = UIFont(name: "Arial", size: normalCellLabel1FontSize)
            cell.itemLabel1.textAlignment = NSTextAlignment.left
            
            cell.itemLabel2.frame = CGRect(origin: CGPoint(x: leftMargin,y :label2YPosition),
                                           size: CGSize(width: calculatedWidth, height: label2Height))
            cell.itemLabel2.font = UIFont.boldSystemFont(ofSize: normalCellLabel2FontSize)
            cell.itemLabel2.textColor = UIColor.white
            cell.itemLabel2.font = UIFont(name: "Kailasa", size: normalCellLabel2FontSize)
            cell.itemLabel2.textAlignment = NSTextAlignment.left
            
            
            //TODO: what happens for the rest of the cases (color. no italics, etc..)
            
            
        }
        
        //TODO: make this a function
        //        if indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 9
        //        {
        //            cell.contentView.isHidden = true
        //        }
        //        else
        //        {
        //            cell.contentView.isHidden = false
        //        }
        //
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1.0 // TODO: unhardcode numbers. Make global
        cell.layer.backgroundColor = UIColor.darkGray.cgColor
        cell.itemLabel1.text = allCellItem[indexPath.item][0]
        cell.itemLabel2.text = allCellItem[indexPath.item][1]
        
        
        return cell
    }
    
    // MARK: - Click Listener Event for a specific cell in the UICollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let message = allCellItem[indexPath.row][0] + " " + allCellItem[indexPath.row][1]
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
        let sectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainStoryBoard.sectionFooterView, for: indexPath) as! SectionFooterView
        
        let icon = sectionFooter[indexPath.row]
        sectionFooterView.icon = icon
        
        return sectionFooterView
    }
    
    var menuShowing = false
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    
    @IBAction func toggleMenu(_ sender: Any) {
        
        if menuShowing{
            leadingConstraint.constant = -210
        } else {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
        }
        
        menuShowing = !menuShowing
    }
    
    
}


