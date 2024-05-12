//
//  LocalManager.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

final class LocalManager {
    static let shared = LocalManager()
    private init(){}
    
    var recentCountries : [String] {
        set{
            UserDefaults.standard.setValue(newValue, forKey: "recents")
        }
        get{
            UserDefaults.standard.stringArray(forKey: "recents") ?? []
        }
    }
    func saveNewCountry(country : String){
        var recentCountries = recentCountries
        recentCountries.append(country)
        LocalManager.shared.recentCountries = recentCountries
    }
}
