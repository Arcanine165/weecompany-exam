//
//  SearchCountryViewController.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

class SearchCountryViewController: UIViewController {
    var presenter : SearchCountryPresenterProtocol?
    let tfSearch : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Escribe un pais"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let btnShowRecents : UIButton = {
        let btn = UIButton()
        btn.setTitle("Mostrar recientes", for: .normal)
        btn.backgroundColor = .systemYellow
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(showRecents), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    var recents : [String]?
    
    lazy var horizontalStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tfSearch,btnShowRecents])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupUI()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recents = LocalManager.shared.recentCountries
        tableView.reloadData()
    }
    
    func setupUI(){
        title = "Buscar Pais"
        view.backgroundColor = .white
        tfSearch.delegate = self
        view.addSubview(horizontalStack)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            horizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            
            tableView.topAnchor.constraint(equalTo: horizontalStack.topAnchor,constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
   
   
}


extension SearchCountryViewController : SearchCountryViewProtocol{
    func showCountryNotFound() {
        let vc = CountryNotFoundViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func goToDetail(countryName: String,comesFromRecents : Bool = false) {
        let view = CountryDetailViewController()
        let service = CountryDetailService()
        let presenter = CountryDetailPresenter(view: view, service: service)
        view.presenter = presenter
        view.countryName = countryName
        if !comesFromRecents && !LocalManager.shared.recentCountries.contains(where: {$0 == countryName}){
            LocalManager.shared.saveNewCountry(country: countryName)
        }
        navigationController?.pushViewController(view, animated: true)
    }
    
    
}


