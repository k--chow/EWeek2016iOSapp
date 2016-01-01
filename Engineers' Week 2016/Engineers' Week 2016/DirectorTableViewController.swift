//
//  DirectorTableViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/26/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class DirectorTableViewController: UITableViewController {

    var directors = [Director]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 138.0;
        getDirectors()
    }
    
    func getDirectors() {
        let postEndpoint: String = "https://eweek2016.herokuapp.com/api/directors"
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
                        let position = a["position"] as? String
                        let photoLink = a["image"] as? String
                        
                        
                        let director1 = Director(name: name!, photo: nil, photoLink: photoLink!, position: position!)!
                        
                        self.getImage(director1)
                        self.directors.append(director1)
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
        

    }
    
    func getImage(director: Director) {
        let url2 = NSURL(string: director.photoLink)
        let data = NSData(contentsOfURL:url2!)
        if data != nil {
            director.photo = UIImage(data:data!)
            print("ho")
        }
        else
        {
            print("no")
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
        return directors.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "DirectorTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DirectorTableViewCell
        let director = directors[indexPath.row]
        cell.directorName.text = director.name
        cell.directorPosition.text = director.position
        cell.directorPhoto.image = director.photo
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
