//
//  ViewController.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 21/05/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
    
    let NUMBEROFSUGGEST = 3
    
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    @IBOutlet weak var SuggestedHeroeslbl: UILabel!
    
    var heroesSearchModel:SuperHeroSearchModel?
    
    var selectedHero:SuperHeroModel?
    
    var selectedSuggestedHeroes : [SuperHeroModel?] = []
        
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var suggestTableView: UITableView!
    
    @IBOutlet weak var firstLoadImg: UIImageView!
    
    //Random 3 suggested heros 
    let suggestArrIds = [String(Int.random(in: 1...731)),String(Int.random(in: 1...731)),String(Int.random(in: 1...731))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jeremyGif = UIImage.gifImageWithName("gif1")
//            let imageView = UIImageView(image: jeremyGif)
            
        self.firstLoadImg.image = jeremyGif
        
        
        
        suggestTableView.register(UINib(nibName: "SuggestTableViewCell", bundle: nil), forCellReuseIdentifier: "SuggestTableViewCell")
        
        
        self.loaderView.isHidden = false
        self.loaderView.startAnimating()
        
        self.SuggestedHeroeslbl.isHidden = true
        self.searchTableView.isHidden = true
        self.suggestTableView.isHidden = true
        self.searchBar.isHidden = true
        
        self.searchBar.delegate = self
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        
        self.suggestTableView.delegate = self
        self.suggestTableView.dataSource = self
        
        for n in suggestArrIds{
            ApiManager.getDataById(id:n){hero in
                self.selectedSuggestedHeroes.append(hero)
                if self.selectedSuggestedHeroes.count == 3{
                    self.suggestTableView.reloadData()
                    self.loaderView.isHidden = true
                    self.loaderView.stopAnimating()
                    self.firstLoadImg.isHidden = true
                    self.searchBar.isHidden = false
                    self.SuggestedHeroeslbl.isHidden = false
                    self.suggestTableView.isHidden = false
                }
            }
        }
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == suggestTableView{
            return selectedSuggestedHeroes.count
        }
        else{
            return heroesSearchModel?.results.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == suggestTableView{
            return 110
        }
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == suggestTableView{
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestTableViewCell", for: indexPath) as! SuggestTableViewCell
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.suggestNamelbl.text = self.selectedSuggestedHeroes[indexPath.row]?.name
            let url = URL(string: selectedSuggestedHeroes[indexPath.row]?.image.url ?? "")
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                    let image = UIImage(data: imageData)
                cell.suggestImg.image = image
                }
            
            cell.selectedBackgroundView = backgroundView
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! ThumbTVCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.hero = heroesSearchModel?.results[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == suggestTableView{
            selectedHero = selectedSuggestedHeroes[indexPath.row]
                
        }
        if tableView == searchTableView{
            selectedHero = heroesSearchModel?.results[indexPath.row]
        }
        performSegue(withIdentifier: "heroInfo", sender: nil)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(false)
        self.searchTableView.isHidden = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTableView.isHidden = false
        ApiManager.getHeroesBySearch(name: searchText){ heroes in
            self.heroesSearchModel = heroes
            self.searchTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "heroInfo",let heroInfoVC = segue.destination as? HeroInfoVC{
            heroInfoVC.heroData = selectedHero
        }
    }
    

}

