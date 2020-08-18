//
//  SearchTableViewCell.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 11/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var trendingNumber: UILabel!
    
    @IBOutlet weak var hashtag: UILabel!
    
    @IBOutlet weak var hashtagTweetCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
