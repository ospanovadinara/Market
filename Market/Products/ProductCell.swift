//
//  ProductCell.swift
//  Market
//
//  Created by Dinara on 26.12.2023.
//

import UIKit
import SnapKit

final class ProductCell: UICollectionViewCell {

    private var productCount = 0

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

    private lazy var priceLabel: UILabel = {
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
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = AppFont.medium.s16()
        button.backgroundColor = UIColor(named: "Market Green")
        button.addTarget(self,
                         action: #selector(addButtonDidTap),
                         for: .touchUpInside)
        return button
    }()

    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 16
        button.addTarget(self,
                         action: #selector(minusButtonDidTap),
                         for: .touchUpInside)
        button.setTitle("-", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "Market Green")
        button.isHidden = true
        return button
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.addTarget(self,
                         action: #selector(plusButtonDidTap),
                         for: .touchUpInside)
        button.setTitle("+", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "Market Green")
        button.isHidden = true
        return button
    }()

    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "\(productCount)"
        label.font = AppFont.medium.s18()
        label.textColor = UIColor(named: "Market Black")
        label.textAlignment = .center
        label.isHidden = true
        return label
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
         priceLabel,
         addButton,
         minusButton,
         plusButton,
         counterLabel
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

        priceLabel.snp.makeConstraints { make in
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

        minusButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            make.height.equalTo(32)
        }

        plusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-4)
            make.height.equalTo(32)
        }

        counterLabel.snp.makeConstraints { make in
            make.centerY.equalTo(plusButton.snp.centerY)
            make.centerX.equalToSuperview()
        }
    }


    // MARK: - Actions
    @objc func minusButtonDidTap() {

    }

    @objc func plusButtonDidTap() {

    }

    @objc func addButtonDidTap() {
        addButton.isHidden = true
        plusButton.isHidden = false
        minusButton.isHidden = false
        counterLabel.isHidden = false
        counterLabel.text = "\(productCount)"
    }
}

extension ProductCell {
    // MARK: - Public properties
    public static let cellID = String(describing: ProductCell.self)
}
