//
//  MainCollectionViewCell.swift
//  Market
//
//  Created by Dinara on 20.12.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class MainCollectionViewCell: UICollectionViewCell {

    // MARK: - UI
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        return image
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s20()
        label.textColor = UIColor(named: "Market White")
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientLayers()
    }
}

private extension MainCollectionViewCell {
    func setupViews() {
        [imageView,
         label
        ].forEach { contentView.addSubview($0) }
    }

    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.width.equalTo(166)
            make.height.equalTo(180)
            make.edges.equalToSuperview()
        }

        imageView.snp.makeConstraints { make in
            make.width.equalTo(166)
            make.height.equalTo(180)
        }

        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }

    func setupGradientLayers() {
        imageView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        let width = bounds.width
        let height = bounds.height
        let sHeight:CGFloat = 100.0
        let shadow = UIColor.black.withAlphaComponent(0.7).cgColor

        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: height - sHeight, width: width, height: sHeight)
        gradient.colors = [UIColor.clear.cgColor, shadow]
        imageView.layer.insertSublayer(gradient, at: 0)
    }
}

extension MainCollectionViewCell {

    // MARK: - Public Properties
    public static let cellID = String(describing: MainCollectionViewCell.self)

    // MARK: - Public Methods
    public func configureCell(with model: CategoryModel) {
        label.text = model.name
        if let imageUrl = model.imageUrl, let url = URL(string: imageUrl) {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
    }
}
