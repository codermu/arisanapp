//
//  InvitationTableViewCell.swift
//  Arisan
//
//  Created by ibrahim on 11/9/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class InvitationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var inviterAvatar: UIImageView!
    @IBOutlet weak var memberAvatar1: UIImageView!
    @IBOutlet weak var memberAvatar2: UIImageView!
    @IBOutlet weak var memberAvatar3: UIImageView!
    @IBOutlet weak var memberAvatar4: UIImageView!
    
    @IBOutlet weak var inviterName: UILabel!
    @IBOutlet weak var invitationTitle: UILabel!
    @IBOutlet weak var invitationSubtitle: UILabel!
    
    @IBOutlet weak var joinButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
