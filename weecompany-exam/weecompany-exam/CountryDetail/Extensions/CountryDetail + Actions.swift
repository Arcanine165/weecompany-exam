//
//  CountryDetail + Actions.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

extension CountryDetailViewController{
    @objc func goToMaps(){
        
        guard let urlString = countryMapUrl,let url = URL(string: urlString ) else {
          return
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @objc func showCountryImage(){
        let vc = CountryFlagViewController()
        vc.flag = flag
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
