//
//  URLCell.swift
//  Smashtag
//
//  Created by Liang Tang on 5/3/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit

class URLCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    var tweet: Tweet?
  
    func updateUI(indexPath: NSIndexPath, sectionIDNameMap: [Int: String]){
        if let sectionMap = sectionIDNameMap[indexPath.section]{
            switch sectionMap {
            case "urls": contentLabel.text = (tweet?.urls[indexPath.row].keyword)!
            case "hashtag": contentLabel.text = (tweet?.hashtags[indexPath.row].keyword)!
            case "userMentions": contentLabel.text = (tweet?.userMentions[indexPath.row].keyword)!
            default: contentLabel.text = "error"
            }
        }
    }
    
    func removeOptional(str: String) -> String{
        let newString = str.stringByReplacingOccurrencesOfString("Optional\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString("\")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return newString;
    }
}
