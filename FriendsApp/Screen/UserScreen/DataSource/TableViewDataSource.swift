//
//  TableViewDataSource.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/9/22.
//

import UIKit

class TableViewDataSource: NSObject {
    
    // - TableView
    private var tableView: UITableView
        
    // - Data
    var person: Person?
        
    init(tableView: UITableView, person: Person) {
        self.tableView = tableView
        self.person = person
        super.init()
        configure()
    }
    
}

//MARK: - UITableViewDataSource
extension TableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return userCell(cellForRowAt: indexPath)
    }
    
}

//MARK: - Cell
private extension TableViewDataSource {

    func userCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.reuseID, for: indexPath) as! FirstTableViewCell
            
            cell.set(person: person!)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.reuseID, for: indexPath) as! SecondTableViewCell
            cell.set(person: person!)
            return cell
        }
    }
    
}

//MARK: - UITableViewDelegate
extension TableViewDataSource: UITableViewDelegate {
     
}

//MARK: - Configure
private extension TableViewDataSource {
    
    func configure() {
        registerCells()
        setupDataSource()
    }
    
    func setupDataSource() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerCells() {
        tableView.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.reuseID)
        tableView.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.reuseID)
    }
    
}
