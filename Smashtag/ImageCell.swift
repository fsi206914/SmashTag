//
//  ImageCell.swift
//  Smashtag
//
//  Created by Liang Tang on 5/3/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var pictureImageView: UIImageView!
    func updateUI(){

        //        let url: NSString = "https://pbs.twimg.com/media/ChlUhrlUgAEO31L.jpg"
        //        var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        //        let pictureURL = NSURL(string: urlStr as String)!
        
        if let pictureURL = tweet?.media[0].url {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                if let imageData = NSData(contentsOfURL: pictureURL){
                    dispatch_async(dispatch_get_main_queue(), {
                        self.pictureImageView?.image = UIImage(data: imageData)                        });
                }
            }
        }
    }
    
}

