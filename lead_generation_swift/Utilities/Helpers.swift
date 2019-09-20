//
//  Helpers.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

class Helpers {

    // MARK: - Public API
    static func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: IS_LOGGED_IN)
    }
    
    static func getDate(from string: String) -> Date? {
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter.date(from: string)
    }
    
   // static func getFilter(from string: String) -> ?? {
   //     let stringFormatter = stringFormatter()
   //     stringFormatter.stringFormat = "FED SAV (Scottsdale) - VA (150k/199k - 3.75%)"

    }
    

