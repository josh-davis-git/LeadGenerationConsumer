//
//  Lead.swift
//  Josh
//
//  Created by Josh Davis on 11/11/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import Foundation

struct Lead {
    
    // MARK: - Properties
    var leadID = ""
    var leadDate: Date?
    var leadStatus = ""
    var matchedPartners = [Partner]()
    var firstName = ""
    var lastName = ""
    
    // MARK: - Initializer
    init(with json: JSON) {
        if let leadID = json["lead_id"] as? String {
            self.leadID = leadID
        }
        
        if let leadDate = json["lead_date"] as? String {
            self.leadDate = Helpers.getDate(from: leadDate)
        }
        
        if let leadStatus = json["lead_status"] as? String {
            self.leadStatus = leadStatus
        }
        
        // Matched Partners.
        if let matchedPartners = json["matched_partners"] as? JSON {
            if let matchedPartner = matchedPartners["matched_partner"] as? JSONArray {
                for partnerJSON in matchedPartner {
                    self.matchedPartners.append(Partner(with: partnerJSON))
                }
            }
        }
        
    }

    // MARK: - Public API
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
}
