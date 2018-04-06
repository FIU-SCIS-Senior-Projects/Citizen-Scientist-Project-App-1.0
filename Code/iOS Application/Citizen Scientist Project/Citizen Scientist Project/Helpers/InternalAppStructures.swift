//
//  InternalAppStructures.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/6/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

struct Link {
    var text: String?
    var url: URL
    
    init(text: String? = nil, url: URL){
        self.text = text
        self.url = url
    }
}

struct ImageLink {
    var imageName: String
    var link: Link
}

struct FileResource {
    var text: String
    var resource: String
    var fileType: FileType
    
    enum FileType: String {
        case PDF = "pdf"
        case PPTX = "pptx"
    }
}
