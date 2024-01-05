//
//  ProductsViewController.swift
//  Market
//
//  Created by Dinara on 21.12.2023.
//

import UIKit
import SnapKit

final class ProductsViewController: UIViewController {
    private var categories: [String] = [
        "Все",
        "Фрукты",
        "Сухофрукты",
        "Овощи",
        "Зелень",
        "Чай кофе",
        "Молочные продукты",
    ]

    // MARK: - UI
    private lazy var  productsView: ProductsView = {
        let view = ProductsView()
        return view
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupViews()
        setupConstraints()
    }
}

private extension ProductsViewController {
    // MARK: - Setup Navigation Controller
    func setupNavigationController() {
        self.navigationItem.title = "Продукты"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "left_arrow_icon"),
            style: .plain,
            target: self,
            action: #selector(backButtonDidTap))
    }

    // MARK: - Navigation Controller Action
    @objc
    func backButtonDidTap() {
        //TODO
    }

    func setupViews() {
        // MARK: - SearchBar Delegate
        productsView.searchBar.delegate = self

        // MARK: - Categories CollectionView DataSource/Delegate
        productsView.categoriesCollectionView.dataSource = self
        productsView.categoriesCollectionView.delegate = self

        // MARK: - Products CollectionView DataSource/Delegate
        productsView.productsCollectionView.dataSource = self
        productsView.productsCollectionView.delegate = self

        // MARK: - Category Cell Registration
        productsView.categoriesCollectionView.register(
            CategoryCell.self,
            forCellWithReuseIdentifier: CategoryCell.cellID
        )

        // MARK: - Product Cell Registration
        productsView.productsCollectionView.register(
            ProductCell.self,
            forCellWithReuseIdentifier: ProductCell.cellID
        )

        view.addSubview(productsView)
    }

    func setupConstraints() {
        productsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ProductsViewController: UISearchBarDelegate {
    //TODO
}

extension ProductsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productsView.categoriesCollectionView {
            return categories.count
        } else if collectionView == productsView.productsCollectionView {
            return 6
        }

        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productsView.categoriesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.cellID,
                for: indexPath) as? CategoryCell else {
                fatalError("Could not cast to CategoryCell")
            }
            cell.label.text = categories[indexPath.item]
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCell.cellID,
                for: indexPath) as? ProductCell else {
                fatalError("Could not cast to ProductCell")
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productsView.categoriesCollectionView {
            let labelWidth = categories[indexPath.item].width(withConstrainedHeight: 27, font: AppFont.medium.s16())
            let cellWidth = labelWidth + 12
            return CGSize(width: cellWidth, height: 27)
        } else {
            return CGSize(width: 50, height: 50)
        }
    }
}

extension ProductsViewController: UICollectionViewDelegate {
    //TODO
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout {
    //TODO
}

