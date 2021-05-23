//
//  ThumbTVCell.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 22/05/2021.
//

import UIKit

class ThumbTVCell: UITableViewCell {

    var  hero:SuperHeroModel?{
        didSet{
            heroNamelbl.text = hero?.name
            alterEgoNamelbl.text = hero?.biography.fullName
            if let imgUrl = hero?.image.url {
                let url = URL(string: imgUrl)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    heroImg.image = image
                    }
            }
        }
    }
    
    @IBOutlet weak var heroNamelbl: UILabel!
    @IBOutlet weak var alterEgoNamelbl: UILabel!
    @IBOutlet weak var heroImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
