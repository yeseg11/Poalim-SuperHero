//
//  HeroInfoVC.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 21/05/2021.
//

import UIKit

class HeroInfoVC: UIViewController,UICollectionViewDataSource {

    var heroData:SuperHeroModel?
    
    let NUMBEROFCARDS = 3 //The number of horizental cards
    
    @IBOutlet weak var heroCollectionInfo: UICollectionView!
    
    @IBOutlet weak var shereBtn: UIButton!
    
    @IBOutlet weak var heroName: UILabel!
    
    @IBOutlet weak var heroImg: UIImageView!
    
    @IBOutlet weak var heroWeightlbl: UILabel!
    
    @IBOutlet weak var heroHeightlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let name = heroData?.name{
            heroName.text = name
        }
        else
        {
            heroName.text = "No Name found"
        }
        if let weight = heroData?.appearance.weight{
            heroWeightlbl.text = weight[1]
        }
        else
        {
            heroWeightlbl.text = "0"
        }
        if let height = heroData?.appearance.height{
            heroHeightlbl.text = height[1]
        }
        else
        {
            heroHeightlbl.text = "0"
        }
        if (heroData?.image.url) != nil{
            let url = URL(string: heroData?.image.url ?? "")
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                    let image = UIImage(data: imageData)
                    heroImg.image = image
                }
        }
        
        
        heroCollectionInfo.dataSource = self
        heroCollectionInfo.reloadData()
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NUMBEROFCARDS
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        typealias SupplyHeroCell = UICollectionViewCell & SupplyHeroProtocol
        var cellId:String
        switch indexPath.row {
        case 0:
            cellId = "HeroAppearanceCVCell"
        case 1:
            cellId = "HeroPowerstatsCVCell"
        default:
            cellId = "ConnectionCVCell"
        }
        var cell = heroCollectionInfo.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SupplyHeroCell
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4
        cell.layer.borderWidth = 1
        cell.hero = heroData
        return cell
    }

    @IBAction func shareBtn(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["Name:"+(self.heroData?.name ?? ""),"Gender:"+(self.heroData?.appearance.gender ?? ""),"ImageUrl:"+(self.heroData?.image.url ?? "")],applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
}
