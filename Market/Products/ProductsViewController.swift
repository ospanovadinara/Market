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
    private var productsLoader = ProductsLoader()
    private var products: [ProductsModel] = []

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
        fetchProducts()
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

    func fetchProducts() {
        productsLoader.fetchProducts { result in
            switch result {
            case .success(let products):
                self.products = products
                self.productsView.productsCollectionView.reloadData()
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
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
            return products.count
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
        } else if collectionView == productsView.productsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCell.cellID,
                for: indexPath) as? ProductCell else {
                fatalError("Could not cast to ProductCell")
            }
            let model = products[indexPath.item]
            cell.configureCell(with: model)
            return cell
        }

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productsView.categoriesCollectionView {
            let labelWidth = categories[indexPath.item].width(withConstrainedHeight: 27, font: AppFont.medium.s16())
            let cellWidth = labelWidth + 12
            return CGSize(width: cellWidth, height: 27)
        } else if collectionView == productsView.productsCollectionView {
            let cellWidth = (collectionView.bounds.width - 16 * 3) / 2
            let cellHeight: CGFloat = 228
            return CGSize(width: cellWidth, height: cellHeight)
        } else  {
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

