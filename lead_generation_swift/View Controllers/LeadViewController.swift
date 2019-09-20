//
//  LeadViewController.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

class LeadViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var leads = [Lead]()
    
    // MARK: - Private API
    fileprivate func loadData() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        RESTManager.shared.loadData(from: Endpoints.leads, method: .get, parameters: nil) { (status, response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            if let json = response as? JSON {
                if let response = json["response"] as? JSON {
                    if let leads = response["leads"] as? JSON {
                        if let lead = leads["lead"] as? JSONArray {
                            for leadJSON in lead {
                                self.leads.append(Lead(with: leadJSON))
                            }
                            
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    // MARK: - Segue Management
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? LeadDetailsViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationViewController.lead = leads[indexPath.row]
            }
        }
    }
    
}

extension LeadViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.Cells.lead, for: indexPath)
        
        let lead = leads[indexPath.row]
        cell.detailTextLabel?.text = lead.leadID
        
        if let partner = lead.matchedPartners.first {
            cell.textLabel?.text = partner.companyName
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
