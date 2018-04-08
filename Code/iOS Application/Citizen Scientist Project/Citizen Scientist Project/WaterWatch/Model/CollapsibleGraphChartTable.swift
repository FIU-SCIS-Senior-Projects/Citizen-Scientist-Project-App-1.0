//
//  CollapsibleGraphChartTable.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/22/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

//
// MARK: - Section Data Structure
//

public struct WaterWatchSection {
    
    public var alpha: Float
    var header: String
    var subHeader: String
    var items: [WaterWatchChart]
    var collapsed: Bool
    
    public init(alpha: Float, header: String, subHeader: String, items: [WaterWatchChart], collapsed: Bool = true) {
        self.alpha = alpha
        self.header = header
        self.subHeader = subHeader
        self.items = items
        self.collapsed = collapsed
    }
}


public struct WaterWatchChart {
    
    var title: String
    var chartImage: String
    var legendImage: String
    
    public init(title: String, chartImage: String, legendImage: String) {
        self.title = title
        self.chartImage = chartImage
        self.legendImage = legendImage
    }
}

