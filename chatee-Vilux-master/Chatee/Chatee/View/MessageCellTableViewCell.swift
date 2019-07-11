//
//  MessageCellTableViewCell.swift
//  Chatee
//
//  Created by Matti Schneider on 2019-03-07.
//  Copyright © 2019 Matti Schneider. All rights reserved.
//

import UIKit

class MessageCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var messageBodyLabel: UILabel!
    @IBOutlet weak var messageBodyBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
