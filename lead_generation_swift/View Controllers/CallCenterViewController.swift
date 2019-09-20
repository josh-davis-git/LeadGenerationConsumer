//
//  CallCenterViewController.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

class CallCenterViewController: UIViewController {
    
    // MARK: - Properties
    var leads = [Lead]()
    
    // MARK: - Private API
    fileprivate func loadData() {
        RESTManager.shared.loadData(from: Endpoints.leads, method: .get, parameters: nil) { (status, response) in
            
            if let json = response as? JSON {
                if let response = json["response"] as? JSON {
                    if let leads = response["leads"] as? JSON {
                        if let lead = leads["lead"] as? JSONArray {
                            for leadJSON in lead {
                                self.leads.append(Lead(with: leadJSON))
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
