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
    var navItem:[(image: UIImage, name: String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        loadNavigationItems()
        navigationBarImage()
    }
    
    func navigationBarImage() {
        let image : UIImage = UIImage(named: "0-csp-app-logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = navItem[indexPath.row]
        let segueIdentifier: String
        switch indexPath.row {
        case 0:
            segueIdentifier = "segueToHome"
        case 1:
            segueIdentifier = "segueToProfile"
        case 2:
            segueIdentifier = "segueToGeoHunt"
        case 3:
            segueIdentifier = "segueToCSPLab"
        case 4:
            segueIdentifier = "segueToPrograms"
        case 5:
            segueIdentifier = "segueToEvents"
        case 6:
            segueIdentifier = "segueToNews"
        case 7:
            segueIdentifier = "segueToResoures"
        default:
            segueIdentifier = "segueToHome"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    private func loadNavigationItems() {
        let photo1 = UIImage(named: "home")
        let photo2 = UIImage(named: "profile")
        let photo3 = UIImage(named: "geohunt")
        let photo4 = UIImage(named: "csplab")
        let photo5 = UIImage(named: "programs")
        let photo6 = UIImage(named: "events")
        let photo7 = UIImage(named: "news")
        let photo8 = UIImage(named: "resources")
        
        let name1 = "Home"
        let name2 = "Profile"
        let name3 = "Geo Hunt"
        let name4 = "CSP Lab"
        let name5 = "Programs"
        let name6 = "Events"
        let name7 = "News"
        let name8 = "Resources"
        
        navItem.append((image: photo1! , name: name1))
        navItem.append((image: photo2! , name: name2))
        navItem.append((image: photo3! , name: name3))
        navItem.append((image: photo4! , name: name4))
        navItem.append((image: photo5! , name: name5))
        navItem.append((image: photo6! , name: name6))
        navItem.append((image: photo7! , name: name7))
        navItem.append((image: photo8! , name: name8))
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
