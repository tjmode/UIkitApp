//
//  HomeTableViewCell.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 07/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var tweetText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        userNameLabel.frame.size = userNameLabel.intrinsicContentSize
        userIdLabel.frame.size = userIdLabel.intrinsicContentSize
        timeLabel.frame.size = timeLabel.intrinsicContentSize
        // Initialization code
    }
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    //@IBAction func 

}
