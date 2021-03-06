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
    var tweet: Tweet? = nil{
        didSet{
            sectionIDNameMap = [Int: String]()
            var index = 0;
            if let mediaArr = tweet?.media{
                if mediaArr.count > 0{
                sectionIDNameMap[index] = "image";
                index += 1;
                }
            }
            if tweet?.urls.count>0{
                sectionIDNameMap[index] = "urls";
                index += 1;
            }
            if tweet?.hashtags.count > 0{
                sectionIDNameMap[index] = "hashtag";
                index += 1;
            }
            if tweet?.userMentions.count > 0{
                sectionIDNameMap[index] = "userMentions";
                index += 1;
            }
            print("sectionIDNameMap = \(sectionIDNameMap)")
        }
    }
    
    var sectionIDNameMap = [Int: String]()
    var section = 0;
    
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
        return sectionIDNameMap.count;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionMap = sectionIDNameMap[section]{
            switch sectionMap {
            case "image": return (tweet?.media.count)!;
            case "urls": return (tweet?.urls.count)!;
            case "hashtag": return (tweet?.hashtags.count)!;
            case "userMentions": return (tweet?.userMentions.count)!;
            default: return 1;
            }
        }
        return 1;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: UITableViewCell? = nil
        if let sectionMap = sectionIDNameMap[indexPath.section]{
            if(sectionMap == "image") {
                cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.ImageID, forIndexPath: indexPath) as! ImageCell
                if let imageCell = cell as? ImageCell{
                    imageCell.tweet = tweet;
                    imageCell.updateUI(indexPath);
                }
            }
            else{
                cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.URLID, forIndexPath: indexPath) as! URLCell
                if let urlCell = cell as? URLCell{
                    urlCell.tweet = tweet;
                    urlCell.updateUI(indexPath, sectionIDNameMap: sectionIDNameMap);
                }
            }
        }
        return cell!;
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if let sectionMap = sectionIDNameMap[indexPath.section]{
            if(sectionMap == "image") {
                return CGFloat(330.0);
            }
        }
        return UITableViewAutomaticDimension;
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sectionMap = sectionIDNameMap[section]{
            switch sectionMap {
            case "image": return "Image";
            case "urls": return "URLs";
            case "hashtag": return "HashTags";
            case "userMentions": return "UserMentions";
            default: return " ";
            }
        }
        return " ";
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tdc = segue.destinationViewController as? TweetTableViewController {
            if let identifier = segue.identifier{
                switch identifier {
                case "def":
                    let cell = sender as! URLCell;
                    tdc.searchText = cell.contentLabel.text;
                default: print("error");
                }
            }
        }
    }
}
