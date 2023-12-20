//
//  MainHeaderView.swift
//  Market
//
//  Created by Dinara on 20.12.2023.
//

import UIKit
import SnapKit

final class MainHeaderView: UICollectionReusableView {
    
    // MARK: - Cell Identifier
    public static let headerID = String(describing: MainHeaderView.self)

    // MARK: - UI
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Эко Маркет"
        label.textColor = UIColor(named: "Market Black")
        label.font = AppFont.semibold.s24()
        return label
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
}

private extension MainHeaderView {
    // MARK: - Setup Views
    func setupViews() {
        self.addSubview(label)
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
}
