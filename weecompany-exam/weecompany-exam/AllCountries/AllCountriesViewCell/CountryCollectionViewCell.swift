//
//  CountryCollectionViewCell.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import UIKit
import Kingfisher

class CountryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CountryCollectionViewCell"
    let imvCountry : UIImageView = {
        let imv = UIImageView()
        imv.contentMode = .scaleAspectFill
        imv.clipsToBounds = true
        imv.layer.cornerRadius = 10
        imv.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    let lblCountryOfficialName : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var vStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imvCountry,lblCountryOfficialName])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override func prepareForReuse() {
        imvCountry.image = nil
        lblCountryOfficialName.text = nil
    }
    private func setupUI(){
        contentView.addSubview(vStackView)
        contentView.clipsToBounds = true
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.black.cgColor
        NSLayoutConstraint.activate([
            imvCountry.heightAnchor.constraint(equalToConstant: 75),
            vStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    func configCell(country : Country){
        imvCountry.kf.setImage(with: URL(string: country.flags.png ?? ""))
        lblCountryOfficialName.text = "\(country.name.official)"
    }
    
}
