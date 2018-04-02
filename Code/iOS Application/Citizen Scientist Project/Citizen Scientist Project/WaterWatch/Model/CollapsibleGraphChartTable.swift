//
//  CollapsibleGraphChartTable.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/22/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class WaterWatch {
    static let LEGEND_IMAGE_NAME = "water-watch-charts-legend-vertical"
    
}


//
// MARK: - Section Data Structure
//
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

public struct WaterWatchSection {
    
    var header: String
    var subHeader: String
    var items: [WaterWatchChart]
    var collapsed: Bool
    
    public init(header: String, subHeader: String, items: [WaterWatchChart], collapsed: Bool = true) {
        self.header = header
        self.subHeader = subHeader
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [WaterWatchSection] = [
    WaterWatchSection(header: "WATER CHARTS", subHeader: "STATION BB32 WATER DATA", items: [
        WaterWatchChart(title: "Avg. Temperature (˚C)", chartImage: "water-charts-temperature", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Avg. Salinity (ppt)", chartImage: "water-charts-salinity", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Chlorophyll a (ug/L)", chartImage: "water-charts-chlorophyllA", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Median pH", chartImage: "water-charts-median-ph", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Avg. Dissolved Oxygen (mg/L)", chartImage: "water-charts-dissolved-oxygen", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        ]),
    WaterWatchSection(header: "NUTRIENT CHARTS", subHeader: "STATION BB32 NUTRIENT DATA", items: [
        WaterWatchChart(title: "Silica SI (uM)", chartImage: "nutrient-charts-silica", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Nitrate NO3 (uM)", chartImage: "nutrient-charts-nitrate-no3", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Ammonium NH4 (uM)", chartImage: "nutrient-charts-ammonium", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Nitrite NO2(uM)", chartImage: "nutrient-charts-nitrite-n02", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Nitrite + Nitrate (uM)", chartImage: "nutrient-charts-nitrite-nitrate", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        WaterWatchChart(title: "Phosphate PO4 (uM)", chartImage: "nutrient-charts-phosphate", legendImage: WaterWatch.LEGEND_IMAGE_NAME),
        ]),
]
