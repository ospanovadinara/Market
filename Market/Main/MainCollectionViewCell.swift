//
//  MainCollectionViewCell.swift
//  Market
//
//  Created by Dinara on 20.12.2023.
//

import UIKit
import SnapKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        return image
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s20()
        label.textColor = UIColor(named: "Market White")
        label.textAlignment = .left
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
        }

        imageView.snp.makeConstraints { make in
            make.width.equalTo(166)
            make.height.equalTo(180)
        }

        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}

extension MainCollectionViewCell {

    // MARK: - Public Properties
    public static let cellID = String(describing: MainCollectionViewCell.self)

    // MARK: - Public Methods
    public func configureCell(with model: CategoryModel) {
        label.text = model.name
        imageView.image = model.image
    }
}
