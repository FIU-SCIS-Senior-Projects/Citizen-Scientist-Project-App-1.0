//
//  CollectionViewContentManager.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

extension Array where Iterator.Element == CellContent {
    func nextAvailableCell(fromIndex: Int) -> CellContent?{
        let parentCellId = self[fromIndex].parentId
        let cellParent = self[parentCellId]
        let isParentCellExpanded = cellParent.expandableProperty.isExpanded
        let parentCellChildrenCount = cellParent.expandableProperty.childrenCount
        
        // If the parent of the cell is not expanded
        if isParentCellExpanded == false  && parentCellId != fromIndex{
            return self[fromIndex + parentCellChildrenCount]
        }
        return self[fromIndex]
    }
    
    func numberOfExpandedCells() -> Int{
        var count = 0
        for index in 0..<self.count {
            count = count + 1
            
            // If a particular cell is not expanded, substract the number of children hidden under that cell
            if self[index].expandableProperty.isExpanded == false {
                count = count - self[index].expandableProperty.childrenCount
            }
        }
        return count
    }
}



class ContentManager{
    
    //static let cellIdPrefix = "cell"
    
    static let headerLabelFontSizeSuperCell: CGFloat = 14
    static let subHeaderLabelFontSizeSuperCell: CGFloat = 22
    static let headerLabelFontSizeRegularCell: CGFloat = 8
    static let subHeaderLabelFontSizeRegularCell: CGFloat = 18
    static let globalLightBlue = UIColor(displayP3Red: 95/255.0, green: 172/255.0, blue: 223/255.0, alpha: 1.0)
    static let labelLeftRightPadding: CGFloat = 8
    static let NUMBER_OF_CELLS = 16
    private static let SHADOW_IMAGE_NAME = "20-homepage-image-shadow"
    private static let CSPLAB_CHILDREN_COUNT = 4
    static let CSPLAB_CHILDREN_DEFAULT_VISIBILITY = false // false = children not visible by default, true children visible by default
    
    static let cellToIdMap: Dictionary<Page, Int> = [
        Page.Home: 0,
        Page.News: 1,
        Page.Events: 2,
        Page.KeyChallenge: 3,
        Page.ReefRestoration: 4,
        Page.CSPLab: 5,
        Page.Learn: 6,
        Page.Explore: 7,
        Page.Record: 8,
        Page.Review: 9,
        Page.WaterWatch: 10,
        Page.SeaLevelRise: 11,
        Page.LectureSeries: 12,
        Page.FieldActivities: 13,
        Page.OurPartners: 14,
        Page.ContactUs: 15,
    ]
    
    static let IdToCellMap: Dictionary<Int, Page> = [
        0: Page.Home,
        1: Page.News,
        2: Page.Events,
        3: Page.KeyChallenge,
        4: Page.ReefRestoration,
        5: Page.CSPLab,
        6: Page.Learn,
        7: Page.Explore,
        8: Page.Record,
        9: Page.Review,
        10: Page.WaterWatch,
        11: Page.SeaLevelRise,
        12: Page.LectureSeries,
        13: Page.FieldActivities,
        14: Page.OurPartners,
        15: Page.ContactUs,
    ]
    
    static let cellParentMap: Dictionary<Page, Page> = [
        Page.Home: Page.Home,
        Page.News: Page.News,
        Page.Events: Page.Events,
        Page.KeyChallenge: Page.KeyChallenge,
        Page.ReefRestoration: Page.ReefRestoration,
        Page.CSPLab: Page.CSPLab,
        Page.Learn: Page.CSPLab,
        Page.Explore: Page.CSPLab,
        Page.Record: Page.CSPLab,
        Page.Review: Page.CSPLab,
        Page.WaterWatch: Page.WaterWatch,
        Page.SeaLevelRise: Page.SeaLevelRise,
        Page.LectureSeries: Page.LectureSeries,
        Page.FieldActivities: Page.FieldActivities,
        Page.OurPartners: Page.OurPartners,
        Page.ContactUs: Page.ContactUs,
    ]
    
    class func fetchCellContent() -> [CellContent]
    {
        return getContentData()
    }
    
    private class func getContentData() -> [CellContent]
    {
        let labels = getContentLabels()
        let imageName_Type = getContentImageNames()
        let cellExpandableProperty = getCellsExpandableProperty()
        
        // Get the minimum of the number of elements in labelData and imageNames
        // Ideally every image name should have a corresponding pair of label names. 1:1 relationship
        let numbOfLabels = labels.count
        let numbOfImageNames = imageName_Type.count
        let numbOfCellProperties = cellExpandableProperty.count
        let numbOfIterations = min(numbOfLabels, min(numbOfImageNames, numbOfCellProperties))
        
        var contentData = [CellContent]()
        
        for index in 0..<numbOfIterations{
            
            let imageName = imageName_Type[index].imageName
            let cellType = imageName_Type[index].cellType
            let expandableProperty = cellExpandableProperty[index]
            let label1 = labels[index][0]
            let label2 = labels[index][1]
            let cellLabelsProperties = getCellLabelsProperties(cellType: cellType)
            
            
            let indexCell = IdToCellMap[index] // cell corresponding to index
            let parentCell = cellParentMap[indexCell!] // parent of the cell
            let parentId = cellToIdMap[parentCell!] // id of the parent cell. Id is the index position in [CellContent]
            
            // Set parent id to self id by default
            let cellContent = CellContent(id: index, imageName: imageName, shadowImageName: SHADOW_IMAGE_NAME, labelHeader: label1, labelSubHeader: label2, cellType: cellType, labelsPropetries: cellLabelsProperties, expandableProperty: expandableProperty, parentId: parentId!)
            
            contentData.append(cellContent)
        }
        
        return contentData
        
    }
    
    
    private class func getCellLabelsProperties(cellType: CellContent.CellType) -> CellLabelsProperties
    {
        var cellLabelsProperties = CellLabelsProperties()
        var headerLabelProperties = LabelProperties()
        var subHeaderLabelProperties = LabelProperties()
        
        switch cellType {
        case .Super:
            headerLabelProperties.font = UIFont(name: "HelveticaNeue-MediumItalic", size: headerLabelFontSizeSuperCell)!
            headerLabelProperties.color = UIColor.white
            headerLabelProperties.alignment = NSTextAlignment.center
            subHeaderLabelProperties.font = UIFont(name: "HelveticaNeue-Bold", size: subHeaderLabelFontSizeSuperCell)!
            subHeaderLabelProperties.color = UIColor.white
            subHeaderLabelProperties.alignment = NSTextAlignment.center
        default:
            headerLabelProperties.font = UIFont(name: "HelveticaNeue-Bold", size: headerLabelFontSizeRegularCell)!
            headerLabelProperties.color = globalLightBlue
            headerLabelProperties.alignment = NSTextAlignment.left
            subHeaderLabelProperties.font = UIFont(name: "HelveticaNeue-Bold", size: subHeaderLabelFontSizeRegularCell)!
            subHeaderLabelProperties.color = UIColor.white
            subHeaderLabelProperties.alignment = NSTextAlignment.left
        }
        
        cellLabelsProperties.labelHeaderProperty = headerLabelProperties
        cellLabelsProperties.labelSubHeaderProperty = subHeaderLabelProperties
        return cellLabelsProperties
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
        imageName_Type.append(("6-lab-home-new", .Super))
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
    
    private class func getCellsExpandableProperty() -> [Expandable] {
        var result: [Expandable] = []
        for _ in 0..<NUMBER_OF_CELLS {
            let property = Expandable(isExpanded: true, childrenCount: 0) // default
            result.append(property)
        }
        
        // Change CSP Lab Expandable property
        let cspLabCellId = ContentManager.cellToIdMap[Page.CSPLab]
        result[cspLabCellId!].isExpanded = CSPLAB_CHILDREN_DEFAULT_VISIBILITY
        result[cspLabCellId!].childrenCount = CSPLAB_CHILDREN_COUNT
        
        return result
    }
}
