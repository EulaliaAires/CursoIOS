//
//  playerTableViewCell.swift
//  finalProject
//
//  Created by Treinamento on 01/08/18.
//  Copyright © 2018 PortoDigital. All rights reserved.
//

import UIKit

class playerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
