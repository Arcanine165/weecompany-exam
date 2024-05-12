//
//  SearchCountryViewController + TextField.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

extension SearchCountryViewController : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        presenter?.searchCountry(countryName: text)
    }
}
