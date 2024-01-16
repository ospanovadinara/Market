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
         productsCollectionView
        ].forEach {
            self.addSubview($0)
        }
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
    }
}
