//
//  CountryDetailViewController.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

class CountryDetailViewController: UIViewController {
    // MARK: - ProtocolVariables
    var presenter : CountryDetailPresenterProtocol?
    var countryName : String?
    var countryMapUrl : String?
    var flag : String?
    // MARK: - UI Variables
    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    let mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let lblOfficialName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    let lblCommonName : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    let lblCapitalName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    let lblCurrency : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    let lblCurrencySymbol : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    let btnShowCountryImage : UIButton = {
        let btn = UIButton()
        btn.setTitle("Mostrar bandera", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(showCountryImage), for: .touchUpInside)
        return btn
    }()
    let btnGoToMaps : UIButton = {
        let btn = UIButton()
        btn.setTitle("Ir a mapas", for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(goToMaps), for: .touchUpInside)
        return btn
    }()
    lazy var verticalStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lblOfficialName,lblCommonName,lblCapitalName,lblCurrency,lblCurrencySymbol,btnShowCountryImage,btnGoToMaps])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad(countryName: countryName ?? "")
    }
    
    private func setupUI(){
        title = countryName
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        mainView.addSubview(verticalStack)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            verticalStack.topAnchor.constraint(equalTo: mainView.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 10),
            verticalStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -10),
            verticalStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            
        ])
    }  

}

extension CountryDetailViewController : CountryDetailViewProtocol{
    
    func loadInfo(country: Country) {
        self.countryMapUrl = country.maps.googleMaps
        self.flag = country.flags.png
        lblOfficialName.text = "Nombre oficial : \(country.name.official)"
        lblCommonName.text = "Nombre comun : \(country.name.common)"
        lblCapitalName.text = "Capital : \(country.capital?.joined(separator: ",") ?? "No hay")"
        let currency = country.currencies?.values.first?.innerValue["name"]
        let symbol = country.currencies?.values.first?.innerValue["symbol"]
        lblCurrency.text = "Moneda : \(currency ?? "")"
        lblCurrencySymbol.text = "Simbolo : \(symbol ?? "")"
    }
}
