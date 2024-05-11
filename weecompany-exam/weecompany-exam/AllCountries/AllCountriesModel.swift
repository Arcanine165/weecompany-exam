//
//  AllCountriesModel.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation
struct Country : Codable{
    let name : CountryName
    let region : String
    let maps : CountryMaps
    let population : Int
    let flags : CountryFlags
}


struct CountryName : Codable{
    let common : String
    let official : String
}


struct CountryMaps : Codable{
    let googleMaps : String
    let openStreetMaps : String
}

struct CountryFlags : Codable{
    let png : String?
    let svg : String?
    let alt : String?
    
}
