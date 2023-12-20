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
    private var categoryModel: [CategoryModel] = [
        CategoryModel(
            id: UUID(),
            name: "Фрукты",
            image: UIImage(named: "fruits_image")),
        CategoryModel(
            id: UUID(),
            name: "Сухофрукты",
            image: UIImage(named: "dried_fruits_image")),
        CategoryModel(
            id: UUID(),
            name: "Овощи",
            image: UIImage(named: "veggie_image")),
        CategoryModel(
            id: UUID(),
            name: "Зелень ",
            image: UIImage(named: "greens_image")),
        CategoryModel(
            id: UUID(),
            name: "Чай Кофе",
            image: UIImage(named: "tea_image")),
        CategoryModel(
            id: UUID(),
            name: "Молочные продукты",
            image: UIImage(named: "milk_image")),
    ]

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
            MainCollectionViewCell.self,
            forCellWithReuseIdentifier: MainCollectionViewCell.cellID
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

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        categoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainCollectionViewCell.cellID,
            for: indexPath) as? MainCollectionViewCell else {
            fatalError("Could not cast to MainCollectionViewCell")
        }
        let model = categoryModel[indexPath.item]
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
