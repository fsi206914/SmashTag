//
//  TweetDetailCell.swift
//  Smashtag
//
//  Created by Liang Tang on 5/2/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit

class TweetDetailCell: UITableViewCell {
    var labelText: String?{
        didSet{
            updateUI();
        }
    }

    @IBOutlet weak var testLabel: UILabel!
    
    func updateUI(){
        testLabel?.text = "asdf";
    }
}
