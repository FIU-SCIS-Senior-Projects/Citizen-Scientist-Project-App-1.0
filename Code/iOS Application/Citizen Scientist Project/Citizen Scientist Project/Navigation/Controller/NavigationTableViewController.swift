//
//  NavigationTableViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/19/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class NavigationTableViewController: UITableViewController{
    let cellIdentifier = "NavigationTableViewCell"
    var navItem:[(image: UIImage, name: String, openImage: UIImage)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        loadNavigationItems()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NavigationTableViewCell  else {
            fatalError("The dequeued cell is not an instance of NavigationTableViewCell.")
        }
        
        let item = navItem[indexPath.row]
        
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.pageNameLabel.text = item.name
        cell.pageIconImage.image = item.image
        cell.openImageView.image = item.openImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = navItem[indexPath.row]
        let segueIdentifier: String
        switch indexPath.row {
        case 0:
            segueIdentifier = "segueToHome"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 1:
            segueIdentifier = "segueToProfile"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 2:
            segueIdentifier = "segueToGeoHunt"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 3:
            print("CSP clicked")
        case 4:
            segueIdentifier = "segueToLearn"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 5:
            segueIdentifier = "segueToExplore"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 6:
            segueIdentifier = "segueToRecord"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 7:
            segueIdentifier = "segueToReview"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 8:
            print("Programs clicked")
        case 9:
            segueIdentifier = "segueToKeyChallenge"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 10:
            segueIdentifier = "segueToSeaLevelRise"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 11:
            segueIdentifier = "segueToWaterWatch"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 12:
            segueIdentifier = "segueToReefRestoration"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 13:
            segueIdentifier = "segueToLectureSeries"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 14:
            segueIdentifier = "segueToFieldActivities"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 15:
            segueIdentifier = "segueToEvents"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 16:
            segueIdentifier = "segueToNews"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 17:
            print("Resources clicked")
        case 18:
            segueIdentifier = "segueToAboutUs"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 19:
            segueIdentifier = "segueToOurBiomes"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 20:
            segueIdentifier = "segueToNewsLetter"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 21:
            segueIdentifier = "segueToOurPartners"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        case 22:
            segueIdentifier = "segueToContactUs"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        default:
            segueIdentifier = "segueToHome"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        }
        
    }
    
    private func loadNavigationItems() {
        let photo1 = UIImage(named: "home")
        let photo2 = UIImage(named: "profile")
        let photo3 = UIImage(named: "geohunt")
        let photo4 = UIImage(named: "csplab")
        let photo5 = UIImage(named: "learn")
        let photo6 = UIImage(named: "explore")
        let photo7 = UIImage(named: "record")
        let photo8 = UIImage(named: "review")
        let photo9 = UIImage(named: "programs")
        let photo10 = UIImage(named: "keychallenge")
        let photo11 = UIImage(named: "sealevel")
        let photo12 = UIImage(named: "waterwatch")
        let photo13 = UIImage(named: "reefrestoration")
        let photo14 = UIImage(named: "lectures")
        let photo15 = UIImage(named: "fieldactivities")
        let photo16 = UIImage(named: "events")
        let photo17 = UIImage(named: "news")
        let photo18 = UIImage(named: "resources")
        let photo19 = UIImage(named: "about")
        let photo20 = UIImage(named: "biomes")
        let photo21 = UIImage(named: "newsletters")
        let photo22 = UIImage(named: "partners")
        let photo23 = UIImage(named: "contact")
        
        let name1 = "Home"
        let name2 = "Profile"
        let name3 = "Geo Hunt"
        let name4 = "CSP Lab"
        let name5 = "Learn"
        let name6 = "Explore"
        let name7 = "Record"
        let name8 = "Review"
        let name9 = "Programs"
        let name10 = "Key Challenge"
        let name11 = "Sea Level Rise"
        let name12 = "Water Watch"
        let name13 = "Reef Restoration"
        let name14 = "Lecture Series"
        let name15 = "Field Activities"
        let name16 = "Events"
        let name17 = "News"
        let name18 = "Resources"
        let name19 = "About Us"
        let name20 = "Our Biomes"
        let name21 = "Newsletters"
        let name22 = "Our Partners"
        let name23 = "Contact Us"
        
        let openPhoto1 = UIImage()
        let openPhoto2 = UIImage(named: "downwards-arrow-key")
        
        navItem.append((image: photo1! , name: name1, openImage: openPhoto1))
        navItem.append((image: photo2! , name: name2, openImage: openPhoto1))
        navItem.append((image: photo3! , name: name3, openImage: openPhoto1))
        navItem.append((image: photo4! , name: name4, openImage: openPhoto2!))
        navItem.append((image: photo5! , name: name5, openImage: openPhoto1))
        navItem.append((image: photo6! , name: name6, openImage: openPhoto1))
        navItem.append((image: photo7! , name: name7, openImage: openPhoto1))
        navItem.append((image: photo8! , name: name8, openImage: openPhoto1))
        navItem.append((image: photo9! , name: name9, openImage: openPhoto2!))
        navItem.append((image: photo10! , name: name10, openImage: openPhoto1))
        navItem.append((image: photo11! , name: name11, openImage: openPhoto1))
        navItem.append((image: photo12! , name: name12, openImage: openPhoto1))
        navItem.append((image: photo13! , name: name13, openImage: openPhoto1))
        navItem.append((image: photo14! , name: name14, openImage: openPhoto1))
        navItem.append((image: photo15! , name: name15, openImage: openPhoto1))
        navItem.append((image: photo16! , name: name16, openImage: openPhoto1))
        navItem.append((image: photo17! , name: name17, openImage: openPhoto1))
        navItem.append((image: photo18! , name: name18, openImage: openPhoto2!))
        navItem.append((image: photo19! , name: name19, openImage: openPhoto1))
        navItem.append((image: photo20! , name: name20, openImage: openPhoto1))
        navItem.append((image: photo21! , name: name21, openImage: openPhoto1))
        navItem.append((image: photo22! , name: name22, openImage: openPhoto1))
        navItem.append((image: photo23! , name: name23, openImage: openPhoto1))
    }
    
}
