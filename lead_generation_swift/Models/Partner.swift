//
//  Partner.swift
//  Josh
//
//  Created by Djuro Alfirevic on 11/13/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import Foundation

struct Partner {
    
    // MARK: - Properties
    var partnerID = ""
    var companyName = ""
    var filterSetName = ""
    
    // MARK: - Initializer
    init(with json: JSON) {
        if let partnerID = json["partner_id"] as? String {
            self.partnerID = partnerID
        }
        
        if let companyName = json["company_name"] as? String {
            self.companyName = companyName
        }
        
        if let filterSetName = json["filter_set_name"] as? String {
            self.filterSetName = filterSetName
        }
    }
    
    // MARK: - Public API
    func toString() -> String {
        return "\(companyName)\n \(filterSetName)"
    }
    
}
