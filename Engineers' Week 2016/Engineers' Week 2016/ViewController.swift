//
//  ViewController.swift
//  Engineers' Week 2016
//
//  Created by Kevin Chow on 12/19/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit
//for modal
class ViewController: UIViewController {
    
    func updateIP() {/*
    let APIURL: String = "http://httpbin.org/ip";
    let url = NSURL(string: APIURL)!
    
    let session = NSURLSession.sharedSession()
    session.dataTaskWithURL(url, completionHandler:
    {   ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
    //read JSON
    do {
    if let ipString = NSString(data: data!, encoding: NSUTF8StringEncoding) {
    //parse JSON
    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
    let origin = jsonDictionary["origin"] as! String
    
    //Update the label
    self.performSelectorOnMainThread("updateIPLabel:", withObject: origin, waitUntilDone, false)
    }
    }
    catch {
    print("bad things happened")
    }
    })
        */
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
        let postEndpoint: String = "https://httpbin.org/ip"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: postEndpoint)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(ipString)
                    
                    // Parse the JSON to get the IP
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let origin = jsonDictionary["origin"] as! String
                    
                    // Update the label
                    self.performSelectorOnMainThread("updateIPLabel:", withObject: origin, waitUntilDone: false)
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

