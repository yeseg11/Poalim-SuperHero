//
//  HeroAppearanceCVCell.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 22/05/2021.
//

import UIKit

class HeroAppearanceCVCell: UICollectionViewCell,SupplyHeroProtocol {
    
    
    @IBOutlet weak var genderlbl: UILabel!
    
    @IBOutlet weak var racelbl: UILabel!
    
    @IBOutlet weak var eyeColorlbl: UILabel!
    
    @IBOutlet weak var fullNamelbl: UILabel!
    
    
    @IBOutlet weak var poblbl: UILabel!
    @IBOutlet weak var alterEgolbl: UILabel!
    @IBOutlet weak var alignmentlbl: UILabel!
    @IBOutlet weak var publisherlbl: UILabel!

    
    var  hero:SuperHeroModel?{
        didSet{
            genderlbl.text = hero?.appearance.gender ?? "None"
            
            racelbl.text = hero?.appearance.race ?? "None"

            eyeColorlbl.text = hero?.appearance.eyeColor ?? "None"
            
            fullNamelbl.text = hero?.biography.fullName ?? "None"
            poblbl.text = hero?.biography.placeOfBirth ?? "None"
            alterEgolbl.text = hero?.biography.alterEgos ?? "None"
            alignmentlbl.text = hero?.biography.alignment ?? "None"
            publisherlbl.text = hero?.biography.publisher ?? "None"
        }
    }
    
    
    
    
}
