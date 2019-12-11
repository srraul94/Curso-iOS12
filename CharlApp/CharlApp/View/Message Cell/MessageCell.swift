//
//  MessageCell.swift
//  CharlApp
//
//  Created by Raúl  on 10/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    
    @IBOutlet weak var messageimageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.messageView.layer.cornerRadius = 8.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
