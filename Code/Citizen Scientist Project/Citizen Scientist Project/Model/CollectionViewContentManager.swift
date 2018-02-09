//
//  CollectionViewContentManager.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class ContentManager{
    
    static let cellIdPrefix = "cell"
    
    class func fetchCellContent() -> [CellContent]
    {
        var collectionViewContent = [CellContent]()
        let collectionViewData = getContentData()
        
        for cellContent in collectionViewData{
            collectionViewContent.append(cellContent.value)
        }
        
        return collectionViewContent
    }
    
    private class func getContentData() -> [String : CellContent]
    {
        let labels = getContentLabels()
        let imageNames = getContentImageNames()
        
        // Get the minimum of the number of elements in labelData and imageNames
        // Ideally every image name should have a corresponding pair of label names. 1:1 relationship
        let numbOfLabels = labels.count
        let numbOfImageNames = imageNames.count
        let numbOfIterations = min(numbOfLabels, numbOfImageNames)
        
        var contentData = [String : CellContent]()
        
        for index in 0..<numbOfIterations{
            
            let imageName = imageNames[index]
            let label1 = labels[index][0]
            let label2 = labels[index][1]
            
            let cellContent = CellContent(imageName: imageName, labelHeader: label1, labelSubHeader: label2)
            
            contentData["\(cellIdPrefix)\(index)"] = cellContent
        }
        
        return contentData
        
    }
    
    private class func getContentLabels() -> [[String]]
    {
        let labelData = [
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
        
        return labelData
    }
    
    private class func getContentImageNames() -> [String]{
        let imageNames: [String] = [
            "1-welcome-home",
            "2-news-home",
            "3-events-home",
            "4-key-challenge-home",
            "5-reef-restoration-home",
            "6-lab-home",
            "7-lab-learn",
            "8-lab-explore",
            "9-lab-record",
            "10-lab-review",
            "11-water-watch-home",
            "12-sea-level-home",
            "13-lectures-home",
            "14-field-activities-home",
            "15-partners-home",
            "16-contact-home",
            ]
        return imageNames
    }
}
