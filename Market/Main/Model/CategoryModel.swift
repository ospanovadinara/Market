//
//  CategoryModel.swift
//  Market
//
//  Created by Dinara on 20.12.2023.
//

import UIKit

struct CategoryModel: Codable {
    let id: Int?
    let name: String?
    let imageUrl: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "image"
    }
}


