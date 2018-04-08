//
//  CollapsibleTableContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/8/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class CollapsibleTableContentManager {
    
     static let LEGEND_IMAGE_NAME = "water-watch-charts-legend-vertical"
    
    class func fetchTableContent() -> [WaterWatchSection]{
        
        let sectionsData: [WaterWatchSection] = [
            WaterWatchSection(alpha: 0.1, header: "WATER CHARTS", subHeader: "STATION BB32 WATER DATA", items: [
                WaterWatchChart(title: "Avg. Temperature (˚C)", chartImage: "water-charts-temperature", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Avg. Salinity (ppt)", chartImage: "water-charts-salinity", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Chlorophyll a (ug/L)", chartImage: "water-charts-chlorophyllA", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Median pH", chartImage: "water-charts-median-ph", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Avg. Dissolved Oxygen (mg/L)", chartImage: "water-charts-dissolved-oxygen", legendImage: self.LEGEND_IMAGE_NAME),
                ]),
            WaterWatchSection(alpha: 0.1, header: "NUTRIENT CHARTS", subHeader: "STATION BB32 NUTRIENT DATA", items: [
                WaterWatchChart(title: "Silica SI (uM)", chartImage: "nutrient-charts-silica", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Nitrate NO3 (uM)", chartImage: "nutrient-charts-nitrate-no3", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Ammonium NH4 (uM)", chartImage: "nutrient-charts-ammonium", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Nitrite NO2(uM)", chartImage: "nutrient-charts-nitrite-n02", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Nitrite + Nitrate (uM)", chartImage: "nutrient-charts-nitrite-nitrate", legendImage: self.LEGEND_IMAGE_NAME),
                WaterWatchChart(title: "Phosphate PO4 (uM)", chartImage: "nutrient-charts-phosphate", legendImage: self.LEGEND_IMAGE_NAME),
                ]),
            ]
        
        return sectionsData
    }
    
}