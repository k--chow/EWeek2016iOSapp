//
//  CheckInViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/27/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    var selectedRow: Int = 0

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var organizationPicker: UIPickerView!
    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let pickerData = ["Other", "AeroGators", "A&WMA", "AABE", "AIAA", "AIChE", "ANS", "ASEE", "ASABE", "ASME", "AWRA", "AWWA", "ACE", "ACSE", "ACM", "AES", "BME GSC", "BMES", "COPRI", "EA", "EWH", "EWB", "FES", "FSEA", "FWEA", "FLEG", "GR", "HOPES", "IEEE", "IIE", "INFORMS", "ITE", "NSBE", "oSTEM", "PSR", "PTS", "SSDC", "SFB", "SASE", "SAE (GMS)", "SEE", "SHMPS", "SHPE", "SSE", "SWE", "Solar Gators", "TBP", "Theta Tau", "WECE"]
    override func viewDidLoad() {
        super.viewDidLoad()
        organizationPicker.dataSource = self
        organizationPicker.delegate = self
        
        
            
    }
    func post(params : Dictionary<String, String>, url : String) {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
        } catch {
            //handle error. Probably return or mark function as throws
            print(error)
            return
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            // handle error
            guard error == nil else { return }
            
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Body: \(strData)")
            
            let json: NSDictionary?
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
            } catch let dataError {
                // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
                print(dataError)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                // return or throw?
                return
            }
            
            
            // The JSONObjectWithData constructor didn't return an error. But, we should still
            // check and make sure that json has a value using optional binding.
            if let parseJSON = json {
                // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                let success = parseJSON["success"] as? Int
                print("Succes: \(success)")
            }
            else {
                // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: \(jsonStr)")
            }
            
        })
        
        task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
        selectedRow = row
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
        selectedRow = row
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
        
    }
    @IBAction func doneTap(sender: AnyObject) {
        //dict here
        if (nameTextField.text!.isEmpty)
        {
            print("Please enter your name.")
        }
        else if (eventTextField.text!.isEmpty)
        {
            print("Please enter an event code.")
        }/* if (emailTextField.text!.isEmpty)
        {
            print("Please enter an email.")
        }*/
        else
        {
        let url = "https://eweek2016.herokuapp.com/api/attendees"
        let name = nameTextField.text
        //let code = eventTextField.text
        let email = emailTextField.text
        let organization = pickerData[selectedRow]
        post(["name": name!, "email": email!, "organization": organization], url: url)
        }
    }

}