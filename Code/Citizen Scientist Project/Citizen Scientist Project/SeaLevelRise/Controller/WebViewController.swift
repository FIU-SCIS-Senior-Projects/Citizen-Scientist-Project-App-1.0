//
//  WebKitViewController.swift
//  Test
//
//  Created by David Gonzalez on 2/28/18.
//  Copyright © 2018 David Gonzalez. All rights reserved.
//

import UIKit

var resourceName = ""
var resourceExtension = ""

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: resourceName, ofType: resourceExtension)
        
        let url = NSURL(string: path!)
        let urlRequest = URLRequest(url: url! as URL)
        webView.loadRequest(urlRequest)
    }
    
    
    
    
    
}

