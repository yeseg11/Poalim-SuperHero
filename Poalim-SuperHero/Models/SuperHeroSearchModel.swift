//
//  HeroModel.swift
//  Poalim-SuperHero
//
//  Created by Sagi Marciano on 22/05/2021.
//


//Create a Model for SuperHero api json data
import Foundation
struct SuperHeroSearchModel: Codable{
    let results: [SuperHeroModel] //List of SuperHeroes
}

// MARK: - SuperHeroModel
struct SuperHeroModel: Codable, Hashable, Identifiable {
    
    static func == (lhs: SuperHeroModel, rhs: SuperHeroModel) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.powerstats == rhs.powerstats && lhs.biography == rhs.biography && lhs.connections == rhs.connections && lhs.appearance == rhs.appearance && lhs.image == rhs.image
    }
    
    let id: String
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let connections: Connections
    let image: HeroImage
}

// MARK: - Appearance
struct Appearance: Codable, Hashable {
    let gender, race: String
    let height, weight: [String]
    let eyeColor: String

    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
    }
}

// MARK: - Biography
struct Biography: Codable, Hashable {
    let fullName, placeOfBirth, publisher, alignment,alterEgos: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case placeOfBirth = "place-of-birth"
        case alterEgos = "alter-egos"
        case publisher, alignment
    }
}

// MARK: - Image
struct HeroImage: Codable, Hashable {
    let url: String
}

// MARK: - Connections
struct Connections: Codable, Hashable {
    let groupAffiliation: String
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
    }
}

// MARK: - Powerstats
struct Powerstats: Codable, Hashable {
    let intelligence, strength, speed, power,combat,durability: String
}
