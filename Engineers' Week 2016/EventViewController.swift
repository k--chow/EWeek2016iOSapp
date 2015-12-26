//
//  EventViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/26/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    @IBOutlet weak var eventSociety: UILabel!
    @IBOutlet weak var eventDirector: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventPhoto: UIImageView!
    
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var navTitle: UINavigationItem!
    
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let event = event {
            eventDirector.text = event.director
            eventSociety.text = event.society
            eventDescription.text = event.desc
            eventPhoto.image = event.photo
            eventLocation.text = event.location
            eventTime.text = event.date
            navTitle.title = event.name
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func exit(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        print("Exiting")
    }

}
