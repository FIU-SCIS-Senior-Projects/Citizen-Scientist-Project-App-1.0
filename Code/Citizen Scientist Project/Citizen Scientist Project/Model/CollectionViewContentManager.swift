//
//  CollectionViewContentManager.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class ContentManager{
    
    //static let cellIdPrefix = "cell"
    
    class func fetchCellContent() -> [CellContent]
    {
        return getContentData()
    }
    
    private class func getContentData() -> [CellContent]
    {
        let labels = getContentLabels()
        let imageName_Type = getContentImageNames()
        
        // Get the minimum of the number of elements in labelData and imageNames
        // Ideally every image name should have a corresponding pair of label names. 1:1 relationship
        let numbOfLabels = labels.count
        let numbOfImageNames = imageName_Type.count
        let numbOfIterations = min(numbOfLabels, numbOfImageNames)
        
        var contentData = [CellContent]()
        
        for index in 0..<numbOfIterations{
            
            let imageName = imageName_Type[index].imageName
            let cellType = imageName_Type[index].cellType
            let label1 = labels[index][0]
            let label2 = labels[index][1]
            
            let cellContent = CellContent(imageName: imageName, labelHeader: label1, labelSubHeader: label2, cellType: cellType)
            
            contentData.append(cellContent)
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
    
    private class func getContentImageNames() -> [(imageName: String, cellType: CellContent.CellType)]{
        
        var imageName_Type: [(imageName: String, cellType: CellContent.CellType)] = []
        imageName_Type.append(("1-welcome-home", .Super))
        imageName_Type.append(("2-news-home", .Regular))
        imageName_Type.append(("3-events-home", .Regular))
        imageName_Type.append(("4-key-challenge-home", .Regular))
        imageName_Type.append(("5-reef-restoration-home", .Regular))
        imageName_Type.append(("6-lab-home", .Super))
        imageName_Type.append(("7-lab-learn", .Regular))
        imageName_Type.append(("8-lab-explore", .Regular))
        imageName_Type.append(("9-lab-record", .Regular))
        imageName_Type.append(("10-lab-review", .Regular))
        imageName_Type.append(("11-water-watch-home", .Regular))
        imageName_Type.append(("12-sea-level-home", .Regular))
        imageName_Type.append(("13-lectures-home", .Regular))
        imageName_Type.append(("14-field-activities-home", .Regular))
        imageName_Type.append(("15-partners-home", .Regular))
        imageName_Type.append(("16-contact-home", .Regular))
        
        return imageName_Type
    }
}
