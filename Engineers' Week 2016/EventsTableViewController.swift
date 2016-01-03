//
//  EventsTableViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/21/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit
import SDWebImage

class EventsTableViewController: UITableViewController {
    var events = [Event]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if events.count == 0 {
            print(events.count)
            getEvents()
            
        }
        else
        {
            print("nah")
        }
        //getImage()
        //loadSampleEvents()
    }
    
    
    func getEvents() {
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
        let postEndpoint: String = "https://eweek2016.herokuapp.com/api/events"
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
                
                
                    let json: NSArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                    print(json.count)
                    for(var i=0; i<json.count; i++)
                    {
                        if let a = json[i] as? NSDictionary {
                            let name = a["name"] as? String
                            let date = a["date"] as? String
                            let location = a["location"] as? String
                            let desc = a["description"] as? String
                            let photoLink = a["image"] as? String
                            
                            let event1 = Event(name: name!, photo: nil, date: date!, location: location!, desc: desc!, photoLink: photoLink!, society: "", director: "")!
                            //check if society exists
                            if let society = a["society"] as? String {
                                event1.society = society;
                            }
                            //check if director exists
                            if let director = a["director"] as? String {
                                event1.director = director;
                            }
                            //self.getImage(event1)
                            self.events.append(event1)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.tableView.reloadData()
                            })
                            
                        }
                        else
                        {
                            print(i)
                        }
                    }
                
                
                

                
                
                
            } catch {
                print("bad things happened")
            }
        }).resume()
        self.tableView.reloadData()
        
    }
    
    func getImage(event: Event) {
        let url2 = NSURL(string: event.photoLink)
        let data = NSData(contentsOfURL:url2!)
        if data != nil {
            event.photo = UIImage(data:data!)
            //print("ho")
            
        }

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
        //getEvents()
        let cellIdentifier = "EventsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventsTableViewCell
        let event = events[indexPath.row]
        //let photo1 = UIImage(named: "defaultEvent")
        //cell.eventPhoto.image = photo1
        cell.eventTitle.text = event.name
        cell.eventDate.text = event.date
        cell.eventLocation.text = event.location
        cell.eventSociety.text = event.society
        //cell.eventDesc.text = event.desc
        dispatch_async(dispatch_get_main_queue(), {
            cell.eventPhoto.sd_setImageWithURL(NSURL(string: event.photoLink))
        })
        
        event.photo = cell.eventPhoto.image
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetail")
        {
            print("ShowDetail")
            let eventDetailViewController = segue.destinationViewController as! EventsViewController
            if let selectedEventCell = sender as? EventsTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedEventCell)!
                let selectedEvent = events[indexPath.row]
                eventDetailViewController.event = selectedEvent
            }
        }
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
    @IBAction func refresh(sender: AnyObject) {
            //self.tableView.reloadData()
        print("refresh")
        
    }
    
    

    

    
}
