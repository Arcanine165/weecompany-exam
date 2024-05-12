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
    
    // MARK: - ProtocolVariables
    var countries : [Country] = []
    
    // MARK: - View Variables
    let collectionView : UICollectionView = {
        let flow : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow )
        collection.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: CountryCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    func setupUI(){
        title = "Todos los paises"
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension AllCountriesViewController : AllCountriesViewProtocol{
    func goToDetail(name: String) {
        let view = CountryDetailViewController()
        let service = CountryDetailService()
        let presenter = CountryDetailPresenter(view: view, service: service)
        view.presenter = presenter
        view.countryName = name
        navigationController?.pushViewController(view, animated: true)
    }
    func reloadData(countries : [Country]) {
        DispatchQueue.main.async { [weak self] in
            self?.countries = countries
            self?.collectionView.reloadData()
        }
    }
    
}
