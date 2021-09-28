//
//  RequestNetwork.swift
//  MarvelApp
//
//  Created by Клим on 28.09.2021.
//

import Foundation

class RequestNetwork {
    static let shared = RequestNetwork()
    
    private init() {}
    
    func fetchNetwork<T: Codable>(string: String, expecting: T.Type, completion: @escaping (T)  -> Void) {
        guard let url = URL(string: string) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { print(error); return }
            if let response = response { print(response)}
            guard let data = data else { return }
            let decoder = JSONDecoder()
            
            do {
                let cities = try decoder.decode(T.self, from: data)
                completion(cities)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
