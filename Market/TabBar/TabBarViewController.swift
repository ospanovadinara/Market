//
//  TabBarViewController.swift
//  Market
//
//  Created by Dinara on 19.12.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

private extension TabBarViewController {
    func setupTabBar() {
        view.backgroundColor = .systemBackground
        let main = UINavigationController(rootViewController: MainViewController())
        let basket = UINavigationController(rootViewController: BasketViewController())
        let history = UINavigationController(rootViewController: HistoryViewController())
        let info = UINavigationController(rootViewController: InfoViewController())
        main.tabBarItem = tabItem(for: .main, title: "Главная")
        basket.tabBarItem = tabItem(for: .basket, title: "Корзина")
        history.tabBarItem = tabItem(for: .history, title: "История")
        info.tabBarItem = tabItem(for: .info, title: "Инфо")
        setViewControllers([main, basket, history, info], animated: true)
        selectedIndex = 0

        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.systemGray5.cgColor
        tabBar.tintColor = UIColor(named: "Market Green")
    }

    func tabItem(for type: TabItem, title: String) -> UITabBarItem {
        let item = UITabBarItem(
            title: title,
            image: type.image,
            selectedImage: type.selectedImage
        )
        return item
    }
}

