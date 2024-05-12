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
    let currencies : [String:CountryCurrency]?
    let capital : [String]?
    
}
private struct CustomCodingKeys: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    var intValue: Int?
    init?(intValue: Int) {
        return nil
    }
}
struct CountryCurrency : Codable{
    public var innerValue : [String:String]
    
    public struct Inner: Codable {
        public let name: String?
        public let symbol: String?
    }
    
    private struct CustomCodingKeys: CodingKey {
           var stringValue: String
           init?(stringValue: String) {
               self.stringValue = stringValue
           }
           var intValue: Int?
           init?(intValue: Int) {
               return nil
           }
       }
       public init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CustomCodingKeys.self)
           
           self.innerValue = [String:String]()
           for key in container.allKeys {
               let value = try container.decode(String.self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
               self.innerValue[key.stringValue] = value
           }
       }
    
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
