//
//  TweetDetailController.swift
//  Smashtag
//
//  Created by Liang Tang on 4/30/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit

class TweetDetailController: UITableViewController {
    
    
    var labelText: String? = nil;
    
    var cellDetail = [[String]]();
    
    // MARK: - Public API
    private struct Storyboard {
        static let CellReuseIdentifier = "TweetDetail";
        static let ImageID = "ImageID";
        static let HashtagID = "HashtagID"
        static let URLID = "URLID"
        static let UserId = "UserID"
        
    }
    
    override func viewDidLoad() {
        self.title = "TweetDetail";
        super.viewDidLoad()
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cellDetail.count;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cellDetail[section].count === \(cellDetail[section].count)")
        return cellDetail[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.ImageID, forIndexPath: indexPath) as! ImageCell
        
        cell.changeText = "1";
        
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        print("index = \(indexPath)")
        if(indexPath.row == 0 && indexPath.section == 0) {
            return CGFloat(390.0);
        }
        return UITableViewAutomaticDimension;
    }
}
