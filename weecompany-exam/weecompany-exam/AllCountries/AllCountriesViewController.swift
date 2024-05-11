//
//  AllCountriesViewController.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

class AllCountriesViewController: UIViewController {
    // MARK: - MVP Variables
    var presenter : AllCountriesPresenterProtocol?
    let collectionView : UICollectionView = {
        let flow : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow )
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    func setupUI(){
        title = "Todos los paises"
        view.backgroundColor = .white
    }

}

extension AllCountriesViewController : AllCountriesViewProtocol{
    func reloadData(countries : [Country]) {
        print(countries)
    }
    
}
