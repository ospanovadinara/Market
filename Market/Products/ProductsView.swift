//
//  ProductsView.swift
//  Market
//
//  Created by Dinara on 26.12.2023.
//

import UIKit
import SnapKit

final class ProductsView: UIView {
    // MARK: - UI
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Быстрый поиск"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()

    lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 11
        layout.minimumLineSpacing = 11
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 16,
                                           bottom: 0,
                                           right: 16)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    lazy var basketButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(named: "Market Green")
        button.addTarget(self, action: #selector(basketButtonDidTap), for: .touchUpInside)
        return button
    }()

    lazy var basketLabel: UILabel = {
        let label = UILabel()
        label.text = "Корзина"
        label.font = AppFont.medium.s16()
        label.textColor = .white
        return label
    }()

    lazy var basketImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "basket_image")
        return image
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

private extension ProductsView {
    // MARK: - Setup Views
    func setupViews() {
        [searchBar,
         categoriesCollectionView,
         productsCollectionView,
         basketButton,
         basketLabel
        ].forEach {
            self.addSubview($0)
        }

        [basketImage,
         basketLabel
        ].forEach {  basketButton.addSubview($0)}
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(44)
        }

        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(27)
        }

        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).offset(24)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        basketImage.snp.makeConstraints { make in
            make.top.equalTo(basketButton.snp.top).offset(12)
            make.leading.equalTo(basketButton.snp.leading).offset(16)
            make.bottom.equalTo(basketButton.snp.bottom).offset(-12)
        }

        basketLabel.snp.makeConstraints { make in
            make.leading.equalTo(basketImage.snp.trailing).offset(6)
            make.centerY.equalTo(basketImage.snp.centerY)
        }

        basketButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalTo(168)
            make.height.equalTo(48)
        }
    }

    // MARK: - Actions
    @objc func basketButtonDidTap() {
        
    }
}
