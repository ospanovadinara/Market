//
//  CategoriesService.swift
//  Market
//
//  Created by Dinara on 21.12.2023.
//

import Foundation

protocol CategoriesService {
    func fetchCategories(completion: @escaping (Result <[CategoryModel], Error>) -> Void)
}

final class CategoriesLoader: CategoriesService {
    func fetchCategories(completion: @escaping (Result<[CategoryModel], Error>) -> Void) {
        guard let url = URL(string: "https://neobook.online/ecobak/product-category-list/") else {
            assertionFailure("Unable to construct url")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "accept")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode >= 300 {
                completion(.failure(NetworkError.codeError))
                return
            }

            guard let data = data else {
                return
            }

            do {
                let categories = try JSONDecoder().decode([CategoryModel].self, from: data)
                completion(.success(categories))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

private enum NetworkError: Error {
    case codeError
}
