//
//  CountryFlagViewController.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit

class CountryFlagViewController: UIViewController {
    let imvCountry : UIImageView = {
        let imv = UIImageView()
        imv.contentMode = .scaleToFill
        imv.clipsToBounds = true
        imv.layer.cornerRadius = 10
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    let cancelButton : UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var flag : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeView))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.addSubview(mainView)
        mainView.addSubview(imvCountry)
        mainView.addSubview(cancelButton)
        imvCountry.kf.setImage(with: URL(string: flag ?? ""))
        NSLayoutConstraint.activate([
            imvCountry.topAnchor.constraint(equalTo: mainView.topAnchor),
            imvCountry.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            imvCountry.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            imvCountry.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            cancelButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            cancelButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 10),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 30),
            
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 150),
            mainView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }

    
    @objc func closeView(){
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
