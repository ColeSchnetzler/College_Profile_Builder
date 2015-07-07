//
//  College.swift
//  College Profile Builder
//
//  Created by Cole Schnetzler on 7/6/15.
//  Copyright © 2015 Cole Schnetzler. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var location = ""
    var enrollment = 0
    var image = UIImage(named: "Default")
    var webURL = NSURL(string: "http://google.com")
    
    convenience init(name: String, location: String, enrollment: Int, image: UIImage, webURL: NSURL) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
        self.webURL = webURL
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
