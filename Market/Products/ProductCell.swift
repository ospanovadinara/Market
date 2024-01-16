//
//  ProductCell.swift
//  Market
//
//  Created by Dinara on 26.12.2023.
//

import UIKit
import SnapKit

final class ProductCell: UICollectionViewCell {

    // MARK: - UI
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Market Light Gray")
        view.layer.cornerRadius = 16
        return view
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "apples_image")
        return image
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Яблоко красная радуга сладкая"
        label.font = AppFont.medium.s14()
        label.textColor = UIColor(named: "Market Black")
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s20()
        label.text = "56 с"
        label.textColor = UIColor(named: "Market Green")
        label.textAlignment = .left
        return label
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitle("Добавить цену", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = AppFont.medium.s16()
        button.backgroundColor = UIColor(named: "Market Green")
        return button
    }()

    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.addTarget(self,
                         action: #selector(minusButtonDidTap),
                         for: .touchUpInside)
        return button
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.addTarget(self,
                         action: #selector(minusButtonDidTap),
                         for: .touchUpInside)
        return button
    }()

    private lazy var counter: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = AppFont.medium.s18()
        label.textColor = UIColor(named: "Market Black")
        label.textAlignment = .center
        return label
    }()

    private lazy var counterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 43.5
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProductCell {
    func setupViews() {
        [imageView,
        title
        ].forEach { stackView.addArrangedSubview($0) }

        [stackView,
         subtitle,
         addButton
        ].forEach { view.addSubview($0)}

        contentView.addSubview(view)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(228)
            make.width.equalTo(166)
        }

        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
        }

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(96)
        }

        subtitle.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(4)
            make.bottom.equalTo(addButton.snp.top).offset(-16)
        }

        addButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-4)
            make.height.equalTo(32)
        }
    }


    // MARK: - Actions
    @objc func minusButtonDidTap() {

    }
}

extension ProductCell {
    // MARK: - Public properties
    public static let cellID = String(describing: ProductCell.self)
}
