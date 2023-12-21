//
//  CustomSegmentedControl.swift
//  Market
//
//  Created by Dinara on 21.12.2023.
//

import UIKit
import SnapKit

final class CustomSegmentedControl: UISegmentedControl {
    // MARK: - UI
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(
            items: [
                "Все",
                "Фрукты",
                "Сухофрукты",
                "Овощи",
                "Зелень",
                "Чай кофе",
                "Молочные продукты"]
        )
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor(named: "Market White") ?? UIColor.blue],for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor(named: "Market Gray") ?? UIColor.red],for: .normal)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = UIColor(named: "Market Gray")?.cgColor
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setBackgroundImage(createImageWithColor(color: UIColor.white),
                                            for: .normal,
                                            barMetrics: .default)
        segmentedControl.setBackgroundImage(createImageWithColor(color: UIColor(named: "Market Green") ?? UIColor.green),
                                            for: .selected,
                                            barMetrics: .default)
        segmentedControl.setDividerImage(createImageWithColor(color: .clear),
                                         forLeftSegmentState: .normal,
                                         rightSegmentState: .normal,
                                         barMetrics: .default)
        return segmentedControl
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

private extension CustomSegmentedControl {
    func createImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }

    // MARK: - Setup Views
    func setupViews() {
        self.addSubview(segmentedControl)
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        segmentedControl.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
}
