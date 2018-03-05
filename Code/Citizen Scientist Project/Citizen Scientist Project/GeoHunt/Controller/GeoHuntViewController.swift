//
//  GeoHuntViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/20/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit
import MapKit

class GeoHuntViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavBar()
        setUpMap()
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
    
    func setUpMap(){
        let latitude: CLLocationDegrees = 25.7020076
        let longitude: CLLocationDegrees = -80.1744671
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
    }

}
