//
//  ApiManager.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 22/05/2021.
//

import Foundation
import Alamofire

class  ApiManager {
    static let TOKEN = "10223774787650268" //TOKEN that I get from api with facebook connection
    static let jsonDecoder: JSONDecoder = JSONDecoder() //Its will decoder the jason to the model
    
    
    // Get the data of the super-hero from the API by the hero id.
    static func getDataById(id:String,closer:@escaping(SuperHeroModel)->Void){
        AF.request("https://superheroapi.com/api/"+TOKEN+"/"+id).response { response in
            do{
                debugPrint(response)
                if let data = response.data{
                    let model =  try self.jsonDecoder.decode(SuperHeroModel.self, from: data)
                    closer(model)
                }
            }catch let error{
                print(error)
            }
        }
    }
    
    // Get the data of the super-hero from the API by the hero name.
    static func getHeroesBySearch(name:String,closer:@escaping(SuperHeroSearchModel)->Void){
        AF.request("https://superheroapi.com/api/"+TOKEN+"/search/"+name).response { response in
            do{
                debugPrint(response)
                if let data = response.data{
                    let model =  try self.jsonDecoder.decode(SuperHeroSearchModel.self, from: data)
                    closer(model)
                }
            }catch let error{
                print(error)
            }
        }
    }
}



