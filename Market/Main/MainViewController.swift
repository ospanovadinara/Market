//
//  MainViewController.swift
//  Market
//
//  Created by Dinara on 19.12.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    // MARK: - UI
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Эко Маркет"
        label.textColor = UIColor(named: "Market Black")
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

private extension MainViewController {
    func setupViews() {
        [label
        ].forEach {
            view.addSubview($0)
        }
    }

    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(55)
        }
    }
}
