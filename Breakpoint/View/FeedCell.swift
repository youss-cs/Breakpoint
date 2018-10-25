//
//  FeedCell.swift
//  breakpoint
//
//  Created by Caleb Stultz on 7/24/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, message: Message) {
        self.profileImage.image = profileImage
        self.emailLbl.text = message.senderId
        self.contentLbl.text = message.content
        print(message.senderId)
        print(message.content)
    }
    
}
