//
//  HomeView + Actions.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

extension HomeViewController{
    @objc func goToAllCountries(){
        let vc = AllCountriesViewController()
        let presenter = AllCountriesPresenter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.service = AllCountriesService()
        navigationController?.pushViewController(vc, animated: true)
    }
}
