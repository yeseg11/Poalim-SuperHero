//
//  SuggestTableViewCell.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 21/05/2021.
//

import UIKit

class SuggestTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestImg: UIImageView!
    @IBOutlet weak var suggestNamelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
