//
//  ProductsPageViewController.swift
//  Market
//
//  Created by Dinara on 21.12.2023.
//

import UIKit
import SnapKit

final class ProductsPageViewController: UIViewController {

    // MARK: - UI
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Быстрый поиск"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
    }()

    private lazy var segmentedControl: CustomSegmentedControl = {
        let segmentedControl = CustomSegmentedControl(frame: CGRect.zero)
        return segmentedControl
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupViews()
        setupConstraints()
    }
}

private extension ProductsPageViewController {
    func setupNavigationController() {
        self.navigationItem.title = "Продукты"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "left_arrow_icon"),
            style: .plain,
            target: self,
            action: #selector(backButtonDidTap))
    }

    func setupViews() {
        [searchBar,
         segmentedControl
        ].forEach {
            view.addSubview($0)
        }
    }

    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }

        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(27)
        }
    }

    @objc
    func backButtonDidTap() {
        //TODO
    }
}

extension ProductsPageViewController: UISearchBarDelegate {
    //TODO
}
