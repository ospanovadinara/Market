//
//  ProductsService.swift
//  Market
//
//  Created by Dinara on 16.01.2024.
//

import Foundation
import Alamofire

protocol ProductsService {
    func fetchProducts(completion: @escaping (Result <[ProductsModel], AFError>) -> Void)
}

final class ProductsLoader: ProductsService {
    func fetchProducts(completion: @escaping (Result<[ProductsModel], AFError>) -> Void) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "neobook.online"
        urlComponent.path = "/ecobak/product-list/"

        guard let url = urlComponent.url else {
            return
        }

        AF.request(url, method: .get, headers: ["accept": "application/json"])
            .validate()
            .responseDecodable(of: [ProductsModel].self) { response in
                completion(response.result)
            }
    }
}
