//
//  CategoryCell.swift
//  Market
//
//  Created by Dinara on 26.12.2023.
//

import UIKit
import SnapKit

final class CategoryCell: UICollectionViewCell {

    // MARK: - UI
    lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = contentView.bounds.height / 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: "Market Gray")?.cgColor
        return view
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.font = AppFont.medium.s16()
        label.textColor = UIColor(named: "Market Gray")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = false
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

private extension CategoryCell {
    // MARK: - Setup Views
    func setupViews() {
        view.addSubview(label)
        contentView.addSubview(view)
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

extension CategoryCell {
    // MARK: - Public Properties
    public static let cellID = String(describing: CategoryCell.self)
}

