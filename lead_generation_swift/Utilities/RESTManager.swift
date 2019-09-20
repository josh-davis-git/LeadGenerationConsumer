//
//  AppDelegate.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

// Enums
enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Status: Int {
    case success = 200
    case error = 400
    case serverError = 500
    case notFound = 404
}

// Aliases
typealias JSON = [String: Any]
typealias JSONArray = [JSON]

class RESTManager {
    
    // MARK: - Properties
    static let shared = RESTManager()
    private init() {}
    
    // MARK: - Public API
    public func loadData(from urlString: String, method: HttpMethod, parameters: JSON?, completion: @escaping (_ status: Status, _ data: Any?) -> ()) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
            let request = configureRequestFor(url, method: method, parameters: parameters)
            
            let task = session.dataTask(with: request) { (data, response, error) in
                var status = Status.success
                if let httpResponse = response as? HTTPURLResponse {
                    //status = Status.init(rawValue: httpResponse.statusCode)!
                }
                
                if let error = error {
                    DispatchQueue.main.async(execute: {
                        completion(status, nil)
                        print("Error = \(String(describing: error))")
                    })
                }
                
                // Data acquired
                do {
                    if let data = data {
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        DispatchQueue.main.async(execute: {
                            completion(status, json)
                        })
                    } else {
                        DispatchQueue.main.async(execute: {
                            completion(status, nil)
                        })
                    }
                } catch let error as NSError {
                    DispatchQueue.main.async(execute: {
                        completion(status, nil)
                    })
                    
                    print("JSON error: \(error.localizedDescription)")
                }
            }
            
            task.resume()
        } else {
            DispatchQueue.main.async(execute: {
                completion(Status.error, nil)
            })
        }
    }
    
    // MARK: - Private API
    private func configureRequestFor(_ url: URL, method: HttpMethod, parameters: JSON?) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        return request
    }
    
}

