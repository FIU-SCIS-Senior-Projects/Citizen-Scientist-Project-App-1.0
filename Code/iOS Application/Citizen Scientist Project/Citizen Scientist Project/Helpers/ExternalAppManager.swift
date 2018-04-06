//
//  ExternalApplicationManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/6/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

class ExternalAppManager {
    
    static func openPage(scheme: String? = nil, page: String) {
        
        if let appScheme = scheme {
            if let schemeUrl = NSURL(string: appScheme){
                if UIApplication.shared.canOpenURL(schemeUrl as URL) {
                    // if application is found in the user phone, open application
                    UIApplication.shared.open(schemeUrl as URL, options: [:], completionHandler: nil)
                    return
                }
            }
        }
        
        // Openning application fail, attempt openning using default browser
        UIApplication.shared.open(NSURL(string: page)! as URL, options: [:], completionHandler: nil)

    }
}
