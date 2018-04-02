//
//  SectionFooter.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

struct Icon {
    var sourceName: String
    var type: IconType
    
    enum IconType {
        case Facebook
        case Twitter
        case GooglePlus
        case Youtube
        case Instagram
    }
}

class SectionFooter {
    
    
    class func fetchIcons() -> [Icon]
    {
        var iconList = [Icon]()
        let iconMap = getIcons()
        
        for icon in iconMap {
            let icon = Icon(sourceName: icon.value, type: icon.key)
            iconList.append(icon)
        }
        
        return iconList
    }
    
    private class func getIcons() -> [Icon.IconType : String]
    {
        var iconMap = [Icon.IconType : String]()
        
        iconMap[.Facebook] = "facebook-footer.icon"
        iconMap[.Twitter] = "twitter-footer.icon"
        iconMap[.GooglePlus] = "google-footer.icon"
        iconMap[.Youtube] = "youtube-footer.icon"
        iconMap[.Instagram] = "instagram-footer.icon"
        
        return iconMap
    }
}
