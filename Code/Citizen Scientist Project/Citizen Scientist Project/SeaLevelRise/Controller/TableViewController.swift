//
//  TableViewController.swift
//  Test
//
//  Created by David Gonzalez on 2/28/18.
//  Copyright © 2018 David Gonzalez. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    let segueId = "goToWebView"
    let PDF = "pdf"
    
    //displayFileResource(fileName: "", fileExtension: PDF)
    //openPage(scheme: "", page: "")
    
    
    // 1st Townhall Community Forum
    @IBAction func firstAgendaButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Agenda-for-SLR-Townhall-11-10-2016", fileExtension: PDF)
    }
    @IBAction func firstFactSheetButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Townhall-Fact-Sheet-11-10-2016", fileExtension: PDF)
    }
    @IBAction func firstDraftButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Vulnerability_assessment_11-11-2016", fileExtension: PDF)
    }
    @IBAction func firstYoutubePart1ButtonPressed(_ sender: UIButton) {
        openPage(scheme: "youtube://9JcaAzFVneM", page: "https://www.youtube.com/watch?v=9JcaAzFVneM")
    }
    @IBAction func firstYoutubePart2ButtonPressed(_ sender: UIButton) {
        
        openPage(scheme: "youtube://BLKoeOMG7bA", page: "https://www.youtube.com/watch?v=BLKoeOMG7bA")
    }
    @IBAction func firstYoutubePart3ButtonPressed(_ sender: UIButton) {
        openPage(scheme: "youtube://HA7JKK1RKh4", page: "https://www.youtube.com/watch?v=HA7JKK1RKh4")
    }
    
    // 2nd Townhall Community Forum
    @IBAction func secondAgendaButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Agenda-for-SLR-Townhall-02-16-2017", fileExtension: PDF)
    }
    @IBAction func secondFactSheetButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Townhall-Fact-Sheet-02-16-2017", fileExtension: PDF)
    }
    @IBAction func second100ResilientButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "100-Resilient-Cities", fileExtension: PDF)
    }
    @IBAction func secondGreaterMiamiButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Greater-Miami-and-the-Beaches-Resilience-Strategy", fileExtension: PDF)
    }
    @IBAction func secondSLRAdaptationButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "SLR-Adaptation-Master-Plan", fileExtension: PDF)
    }
    @IBAction func secondVulnerabilityAssesmentPPTXButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func secondVulnerabilityAssessmentButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "VKB-Adaptation-Strategies-v2", fileExtension: PDF)
    }
    @IBAction func secondYoutubeVideoButtonPressed(_ sender: UIButton) {
        openPage(scheme: "youtube://-n83qzHdHUA", page: "https://www.youtube.com/watch?v=-n83qzHdHUA")
    }
    @IBAction func secondFurtherInfoButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "MDPL_17Feb2016", fileExtension: PDF)
    }
    @IBAction func secondFinalReportButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "CRC-VillageOfKeyBiscayne-FinaltVulnAssess-SM", fileExtension: PDF)
    }
    
    
    
    // Workshop: Managing Flood Risk on a Barrier Island
    @IBAction func thirdAdaptationPresentationButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Workshop-Powerpoint-Slides", fileExtension: PDF)
    }
    @IBAction func thirdWorkshopSummaryButtonPressed(_ sender: UIButton) {
        displayFileResource(fileName: "Workshop-Summary-Report_06232017", fileExtension: PDF)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func displayFileResource(fileName: String, fileExtension: String)
    {
        resourceName = fileName
        resourceExtension = fileExtension
        
        performSegue(withIdentifier: segueId, sender: self)
    }
    
    func openPage(scheme: String, page: String) {
        let schemeUrl = NSURL(string: scheme)!
        if UIApplication.shared.canOpenURL(schemeUrl as URL) {
            UIApplication.shared.open(schemeUrl as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(NSURL(string: page)! as URL, options: [:], completionHandler: nil)
        }
    }
    
}

