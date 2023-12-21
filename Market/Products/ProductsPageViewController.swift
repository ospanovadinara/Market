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
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: .zero, height: 50)

        return scrollView
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Быстрый поиск"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
    }()

    private lazy var segmentedControl: CustomSegmentedControl = {
        let segmentedControl = CustomSegmentedControl(frame: CGRect.zero)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        [segmentedControl,
         collectionView
        ].forEach {
            scrollView.addSubview($0)
        }

        [searchBar,
         scrollView
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


        scrollView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(50)
        }

        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading).offset(16)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(27)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
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
