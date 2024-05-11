//
//  AllCountriesViewController + UICollectionProtocols.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation
import UIKit

extension AllCountriesViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.backgroundColor = .red
        return cell
    }
    
    
}
