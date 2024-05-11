//
//  ViewController.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    let btnAllCountriesOption : UIButton = {
        let button = UIButton()
        button.setTitle("Todas los countries", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goToAllCountries), for: .touchUpInside)
        return button
    }()
    let btnSearchCountry : UIButton = {
        let button = UIButton()
        button.setTitle("Buscar country", for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    lazy var vStackViewOptionButtons : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [btnAllCountriesOption,btnSearchCountry])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(vStackViewOptionButtons)
        NSLayoutConstraint.activate([
            vStackViewOptionButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackViewOptionButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStackViewOptionButtons.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
}

