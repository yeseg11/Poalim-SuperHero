//
//  HeroCVCell.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 22/05/2021.
//

import UIKit

class HeroPowerstatsCVCell: UICollectionViewCell,SupplyHeroProtocol {
    
    
    
    
    @IBOutlet weak var powerlbl: UILabel!
    @IBOutlet weak var intelligencelbl: UILabel!
    @IBOutlet weak var strengthlbl: UILabel!
    @IBOutlet weak var speedlbl: UILabel!
    @IBOutlet weak var durabilitylbl: UILabel!
    @IBOutlet weak var combatlbl: UILabel!
    
    
    
    var  hero:SuperHeroModel?{
        didSet{
            powerlbl.text = hero?.powerstats.power ?? "0"
            intelligencelbl.text = hero?.powerstats.intelligence ?? "0"
            strengthlbl.text = hero?.powerstats.strength ?? "0"
            speedlbl.text = hero?.powerstats.speed ?? "0"
            durabilitylbl.text = hero?.powerstats.durability ?? "0"
            combatlbl.text = hero?.powerstats.combat ?? "0"
            
        }
    }
    
    
}
