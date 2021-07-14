//
//  Constants.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

let IS_LOGGED_IN = "IS_LOGGED_IN"
let API_URL = "" // add api_url
let KEY = "" // add key

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
