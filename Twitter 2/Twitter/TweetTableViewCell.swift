//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 12/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var commentProfileImage: UIImageView!
    
    @IBOutlet weak var commentTweetText: UILabel!

    
    @IBOutlet weak var commentUserNameLabel: UILabel!
    @IBOutlet weak var commentTimeLabel: UILabel!
    
    @IBOutlet weak var commentUserIdLabel: UILabel!
    @IBOutlet weak var commentMoreButton: UIButton!
    @IBOutlet weak var commentProfileView: UIView!
    @IBOutlet weak var commentButtonStack: UIStackView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
