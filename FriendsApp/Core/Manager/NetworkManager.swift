//
//  NetworkManager.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/6/22.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func loadJson(filename fileName: String) -> [Person]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Result.self, from: data)
                // print(jsonData)
                return jsonData.self
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}


