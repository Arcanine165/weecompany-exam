//
//  SearchCountryViewController + UITableView.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

extension SearchCountryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = recents?[indexPath.row] ?? ""
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let name = recents?[indexPath.row] else {
            return
        }
        goToDetail(countryName: name,comesFromRecents: true)
    }
    
}
