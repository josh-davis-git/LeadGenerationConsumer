//
//  LeadDetailsViewController.swift
//  Josh
//
//  Created by Djuro Alfirevic on 11/13/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

class LeadDetailsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var textLabel: UILabel!
    var lead: Lead?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lead = lead {
            if let partner = lead.matchedPartners.first {
                textLabel.text = partner.toString()
            }
        }
    }
    
}
