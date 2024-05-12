//
//  CountryNotFoundViewController.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

class CountryNotFoundViewController: UIViewController {
    let lblCountryNotFound : UILabel = {
        let label = UILabel()
        label.text = "Pais no encontrado, busca otro!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let cancelButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Aceptar", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var verticalStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lblCountryNotFound,cancelButton])
        stack.axis = .vertical
        
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let mainView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeView))
        view.addGestureRecognizer(tapGesture)
        setupUI()

    }
    func setupUI(){
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.addSubview(mainView)
        mainView.addSubview(verticalStack)
        NSLayoutConstraint.activate([
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 150),
            mainView.widthAnchor.constraint(equalToConstant: 250),
            
            verticalStack.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            verticalStack.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
            
        ])
    }
    @objc func closeView(){
        dismiss(animated: true)
    }
}
