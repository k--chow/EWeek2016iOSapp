//
//  CheckInViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/27/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var organizationPicker: UIPickerView!
    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let pickerData = ["Other", "AeroGators", "A&WMA", "AABE", "AIAA", "AIChE", "ANS", "ASEE", "ASABE", "ASME", "AWRA", "AWWA", "ACE", "ACSE", "AES", "BME GSC", "BMES", "COPRI", "EA", "EWH", "EWB", "FES", "FSEA", "FWEA", "FLEG", "GR", "HOPES", "IEEE", "IIE", "INFORMS", "ITE", "NSBE", "oSTEM", "PSR", "PTS", "SSDC", "SFB", "SASE", "SAE (GMS)", "SEE", "SHMPS", "SHPE", "SSE", "SWE", "Solar Gators", "TBP", "Theta Tau", "WECE"]
    override func viewDidLoad() {
        super.viewDidLoad()
        organizationPicker.dataSource = self
        organizationPicker.delegate = self
        // Do any additional setup after loading the view.
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
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
        
    }

}