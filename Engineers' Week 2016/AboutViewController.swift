//
//  AboutViewController.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/29/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var aboutScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        aboutScrollView.contentSize.height = 1500
        // Do any additional setup after loading the view.
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

}
