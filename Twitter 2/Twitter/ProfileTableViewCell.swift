//
//  ProfileTableViewCell.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 14/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    
    @IBOutlet weak var profileBio: UILabel!
    @IBOutlet weak var userId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
