//
//  ImageCell.swift
//  Smashtag
//
//  Created by Liang Tang on 5/3/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    
    var changeText: String?{
        didSet{
            updateUI();
        }
    }
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    func updateUI(){
        
        
        let url: NSString = "https://pbs.twimg.com/media/ChX1muwWUAAM1dY.jpg"
        var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!

        let pictureURL = NSURL(string: urlStr as String)!
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            print("access dispatch async. url = \(pictureURL)")
            if let imageData = NSData(contentsOfURL: pictureURL){
                print("access NSDATA.")
                dispatch_async(dispatch_get_main_queue(), {
                    print("access pictureImageView.")
                    self.pictureImageView?.image = UIImage(data: imageData)                        });
            }
        }
    }
    
}
