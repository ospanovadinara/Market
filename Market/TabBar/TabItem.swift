//
//  TabItem.swift
//  Market
//
//  Created by Dinara on 19.12.2023.
//

import UIKit

enum TabItem: Int {
    case main
    case basket
    case history
    case info

    var image: UIImage? {
        switch self {
        case .main: return UIImage(named: "main_inactive")
        case .basket: return UIImage(named: "basket_inactive")
        case .history: return UIImage(named: "history_inactive")
        case .info: return UIImage(named: "info_inactive")
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .main: return UIImage(named: "main_active")
        case .basket: return UIImage(named: "basket_active")
        case .history: return UIImage(named: "history_active")
        case .info: return UIImage(named: "info_active")
        }
    }
}

