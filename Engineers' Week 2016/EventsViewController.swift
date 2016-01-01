//
//  EventsViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/30/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    var event: Event?
    
    @IBOutlet weak var descriptionScroll: UIScrollView!
    @IBOutlet weak var eventSociety: UILabel!
    @IBOutlet weak var eventDirector: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventPhoto: UIImageView!
    
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var navTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionScroll.contentSize.height = 1000
        if let event = event {
            eventDirector.text = event.director
            if (event.society != "")
            {
            eventSociety.text = event.society
            }
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
    
    @IBAction func exit(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        print("Exiting")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
