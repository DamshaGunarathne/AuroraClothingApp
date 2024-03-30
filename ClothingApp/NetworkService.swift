//
//  NetworkService.swift
//  ClothingApp
//
//  Created by NIBMPC04PC02 on 2024-03-30.
//

import Foundation

class NetworkService {
    func fetchData(from url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let requestURL = URL(string: url) else {
            let error = NSError(domain: "URL", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                let error = NSError(domain: "HTTP", code: statusCode, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                let error = NSError(domain: "Data", code: -1, userInfo: nil)
                completion(.failure(error))
            }
        }.resume()
    }
}
