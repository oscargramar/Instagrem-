//
//  ViewController.swift
//  Instagrem
//
//  Created by Oscar G.M on 2/29/16.
//  Copyright © 2016 GMStudios. All rights reserved.
//

import UIKit
import Parse



class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var posts: [PFObject]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // do something with the data fetched
                self.posts = posts
                self.tableView.reloadData()
                print("retreieved posts")
            } else {
                print("error retrieving posts")
            }
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCellWithIdentifier("InstagremTableViewCell") as! InstagremTableViewCell
        cell.instagremPost = posts[indexPath.row]
        return cell
    
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        if let posts = posts{
            return posts.count
        }
        else{
            return 0
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logOutPressed(sender: AnyObject) {
        PFUser.logOut()
        NSNotificationCenter.defaultCenter().postNotificationName("userLoggedOut", object: nil)
        
    }


}

