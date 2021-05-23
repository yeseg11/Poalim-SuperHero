//
//  ConnectionCVCell.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 22/05/2021.
//

import UIKit

class ConnectionCVCell: UICollectionViewCell,SupplyHeroProtocol {
    
    @IBOutlet weak var ConnectionGroupTV: UITextView!
    
    var  hero:SuperHeroModel?{
        didSet{
            if hero?.connections.groupAffiliation != "-" {
                ConnectionGroupTV.text = hero?.connections.groupAffiliation
            }
            else{
                ConnectionGroupTV.text = "Didnt join to any group"
            }
            
        }
    }
}
