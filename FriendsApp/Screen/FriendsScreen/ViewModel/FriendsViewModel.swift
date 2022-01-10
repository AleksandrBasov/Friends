//
//  FriendsViewModel.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/6/22.
//

import UIKit

class FriendsViewModel {
    
    // - Data
    var userResponse: [Person] = []
    
    // - Managers
    private let network = NetworkManager.shared
    
    func fetchData() {
        self.userResponse = network.loadJson(filename: "generated")!
    }
    
    func sort(name: String) {
        userResponse = userResponse.filter {$0.gender == name }
    }
    
    func filter(searchText: String) {
        userResponse = userResponse.filter({ (Person) -> Bool in
            return searchText.isEmpty ? true : (Person.name?.lowercased().contains(searchText.lowercased()) ?? false )
        })
    }
    
}
