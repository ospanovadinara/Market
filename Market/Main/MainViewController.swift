//
//  MainViewController.swift
//  Market
//
//  Created by Dinara on 19.12.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    // MARK: - Private Properties
    private var categorieыLoader = CategoriesLoader()
    private var categories: [CategoryModel] = []

    // MARK: - UI
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: view.frame.width,
                                          height: view.frame.height)
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            MainViewCell.self,
            forCellWithReuseIdentifier: MainViewCell.cellID
        )
        collectionView.register(
            MainHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MainHeaderView.headerID
        )
        return collectionView
    }()

// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        fetchCategories()
    }
}

private extension MainViewController {

    // MARK: - Setup Views
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

private extension MainViewController {

    // MARK: - CategoriesLoader
    func fetchCategories() {
        categorieыLoader.fetchCategories { result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async { [weak self] in
                    self?.categories = categories
                    self?.collectionView.reloadData()
                }
            case.failure(let error):
                print("Error fetching categories: \(error)")
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainViewCell.cellID,
            for: indexPath) as? MainViewCell else {
            fatalError("Could not cast to MainCollectionViewCell")
        }
        let model = categories[indexPath.item]
        cell.configureCell(with: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, 
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: MainHeaderView.headerID,
            for: indexPath
        ) as? MainHeaderView else {
            fatalError("Could not cast to MainHeaderView")
        }
        return header
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 44)
    }
}
