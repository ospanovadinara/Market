//
//  ProductsModel.swift
//  Market
//
//  Created by Dinara on 16.01.2024.
//

import Foundation

struct ProductsModel: Codable {
    let id: Int?
    let title: String
    let description: String?
    let category: Int
    let imageUrl: String?
    let quantity: Int?
    let price: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case category = "category"
        case imageUrl = "image"
        case quantity = "quantity"
        case price = "price"
    }
}
