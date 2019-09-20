//
//  ViewController.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func submitButtonTapped() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            return
        }
        
        let parameters = [
            "username": username,
            "password": password
        ]
        
        RESTManager.shared.loadData(from: "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1", method: .post, parameters: parameters) { [unowned self] (status, response) in
            
            // If login successful
            if (response as? JSON) != nil {
                UserDefaults.standard.set(true, forKey: IS_LOGGED_IN)
                UserDefaults.standard.synchronize()
                
                self.showTabBar()
            }
        }
    }
    
    // MARK: - Private API
    func showTabBar() {
        let storyboard = UIStoryboard(name: Storyboards.main, bundle: Bundle.main)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: Identifiers.tabBar)
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.window?.rootViewController = tabBarController
        }
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UIResponder
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
