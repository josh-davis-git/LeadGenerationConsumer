//
//  Constants.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

let IS_LOGGED_IN = "IS_LOGGED_IN"
let API_URL = "https://markettech.leadportal.com/new_api/api.php"
let KEY = "0twfI.0g0r9YUWC_-r9YI.ud0KL6I.0gUr9YUW9_0t8s-.bfIWFRXWsO"

struct Storyboards {
    static let main = "Main"
}

struct Identifiers {
    static let login = "LoginViewController"
    static let tabBar = "MainTabBarController"
    
    struct Cells {
        static let lead = "LeadCell"
    }
}

struct Actions {
    static let getLeadDetails = "getLeadDetails"
}

struct Endpoints {
    static let leads = "\(API_URL)?API_Action=\(Actions.getLeadDetails)&Key=\(KEY)&Format=JSON&Lead_Type=19&Last_Lead_ID=65125"
}

struct Segues {
    static let leadDetails = "LeadDetailsSegue"
}
