//
//  APIClient.swift
//  NSURLSessionStub
//
//  Created by qihaijun on 1/25/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

import Foundation

class APIClient {
    lazy var session: DHURLSession = NSURLSession.sharedSession()
    
    var user: User?
    
    func fetchProfileWithName(name: String) {
        guard let url = NSURL(string: "https://api.github.com/users/\(name)") else {
            fatalError()
        }
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if let data = data {
                do {
                    let rawDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]
                    
                    if let name = rawDict["login"] as? String,
                        id = rawDict["id"] as? Int {
                            self.user = User(name: name, id: id)
                    }
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
}