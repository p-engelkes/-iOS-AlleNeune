//
//  ApiPostHandler.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 04/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

class ApiPostHandler {
    var host : String = "http://localhost:3000"
    
    func apiPost(params : NSDictionary, url : String, postCompleted : (succeeded: Bool, postResponse: PostResponse) ->()) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var err: NSError?
        
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            var postResponse = PostResponse(data: data, response: response)
            if (error == nil) {
                postCompleted(succeeded: true, postResponse: postResponse)
            } else {
                postCompleted(succeeded: false, postResponse: postResponse)
            }
        })
        
        task.resume()

    }
}