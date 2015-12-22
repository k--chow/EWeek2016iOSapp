//
//  EventsTableViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/21/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleEvents()
    }
    
    func loadSampleEvents() {
        let p1 = UIImage(named: "photo1")!
        let p2 = UIImage(named: "photo2")!
        let a = Event(name: "Engineering Festival", photo: p1, date: "February 20 - 21", location: "Reitz Union Center", desc: "a")!
        let b = Event(name: "Hour of Code", photo: p2, date: "January 21 - 23", location: "The Fishbowl", desc: "b")!
            events+=[a, b]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "EventsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventsTableViewCell
        let event = events[indexPath.row]
        cell.eventTitle.text = event.name
        cell.eventDate.text = event.date
        cell.eventLocation.text = event.location
        //cell.eventDesc.text = event.desc
        cell.eventPhoto.image = event.photo
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
