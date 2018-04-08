//
//  NavigationPages.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/5/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

class NavigationPage {
    let segueId: String
    
    init(segueId: String){
        self.segueId = segueId
    }
    
    func goTo(sender: UIViewController) {
        sender.performSegue(withIdentifier: segueId, sender: sender)
    }
}



enum Page{
    case Home
    case News
    case Events
    case KeyChallenge
    case ReefRestoration
    case CSPLab
    case Learn
    case Explore
    case Record
    case Review
    case WaterWatch
    case SeaLevelRise
    case LectureSeries
    case FieldActivities
    case OurPartners
    case ContactUs
    case AboutUs
    
    private func page() -> NavigationPage{
        switch self {
            case .Home: return NavigationPage(segueId: "segueToHome")
            case .News: return NavigationPage(segueId: "segueToNews")
            case .Events: return NavigationPage(segueId: "segueToEvents")
            case .KeyChallenge: return NavigationPage(segueId: "segueToKeyChallenge")
            case .ReefRestoration: return NavigationPage(segueId: "segueToReefRestoration")
            case .CSPLab: return NavigationPage(segueId: "default") // Not an actual page
            case .Learn: return NavigationPage(segueId: "segueToLearn")
            case .Explore: return NavigationPage(segueId: "segueToExplore")
            case .Record: return NavigationPage(segueId: "segueToRecord")
            case .Review: return NavigationPage(segueId: "segueToReview")
            case .WaterWatch: return NavigationPage(segueId: "segueToWaterWatch")
            case .SeaLevelRise: return NavigationPage(segueId: "segueToSeaLevelRise")
            case .LectureSeries: return NavigationPage(segueId: "segueToLectureSeries")
            case .FieldActivities: return NavigationPage(segueId: "segueToFieldActivities")
            case .OurPartners: return NavigationPage(segueId: "segueToOurPartners")
            case .ContactUs: return NavigationPage(segueId: "segueToContactUs")
            case .AboutUs: return NavigationPage(segueId: "segueToAboutUs")
        }
        
    }
    
    private func getSegueId() -> String {
        switch self {
            case .Home: return "segueToHome"
            case .News: return "segueToNews"
            case .Events: return "segueToEvents"
            case .KeyChallenge: return "segueToKeyChallenge"
            case .ReefRestoration: return "segueToReefRestoration"
            case .CSPLab: return "default" // Not an actual page
            case .Learn: return "segueToLearn"
            case .Explore: return "segueToExplore"
            case .Record: return "segueToRecord"
            case .Review: return "segueToReview"
            case .WaterWatch: return "segueToWaterWatch"
            case .SeaLevelRise: return "segueToSeaLevelRise"
            case .LectureSeries: return "segueToLectureSeries"
            case .FieldActivities: return "segueToFieldActivities"
            case .OurPartners: return "segueToOurPartners"
            case .ContactUs: return "segueToContactUs"
            case .AboutUs: return "segueToAboutUs"
        }
    }
    
    func goTo(from: UIViewController) {
        self.page().goTo(sender: from)
    }
}
