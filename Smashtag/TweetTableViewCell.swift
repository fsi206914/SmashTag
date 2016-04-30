//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by CS193p Instructor.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell
{
    var labelText: String? = nil;
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
//    init(text: String){
////        self.init(coder:coder);
//        labelText = text;
//    }
    
    
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetCreatedLabel: UILabel!
    
    func updateUI() {
        // reset any existing tweet information
        tweetTextLabel?.attributedText = nil
        tweetScreenNameLabel?.text = nil
        tweetProfileImageView?.image = nil
        tweetCreatedLabel?.text = nil
        
        // load new information from our tweet (if any)
        if let tweet = self.tweet
        {
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil  {
                for _ in tweet.media {
                    tweetTextLabel.text! += " 📷"
                }
                if labelText != nil{
                    var attributedString = NSMutableAttributedString(string:tweet.text);
                    print("labelText = \(labelText)")
                    let range = (tweet.text.lowercaseString as NSString)
.rangeOfString(labelText!.lowercaseString)
                    print("range = \(range)")
                    attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor() , range: range)
                    tweetTextLabel?.attributedText = attributedString;
                }
            }
            
            tweetScreenNameLabel?.text = "\(tweet.user)" // tweet.user.descri   ption
            
            if let profileImageURL = tweet.user.profileImageURL {
                if let imageData = NSData(contentsOfURL: profileImageURL) { // blocks main thread!
                    tweetProfileImageView?.image = UIImage(data: imageData)
                }
            }
            
            let formatter = NSDateFormatter()
            if NSDate().timeIntervalSinceDate(tweet.created) > 24*60*60 {
                formatter.dateStyle = NSDateFormatterStyle.ShortStyle
            } else {
                formatter.timeStyle = NSDateFormatterStyle.ShortStyle
            }
            tweetCreatedLabel?.text = formatter.stringFromDate(tweet.created)
        }

    }
}
