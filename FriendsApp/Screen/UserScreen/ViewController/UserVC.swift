//
//  UserVC.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/9/22.
//

import UIKit

class UserVC: UIViewController {

    // - UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    // - Data
    var person: Person?
    
    // - DataSource
    private var dataSource: TableViewDataSource?
    
    // - ViewModel
    private let viewModel = FriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

// MARK: - Action
private extension UserVC {
    
    @IBAction func backNavigationBarItem(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

// MARK: - configure
private extension UserVC {
    
    func configure() {
        configureDataSource()
        configureNavigationItem()
    }
    
    func configureDataSource() {
        dataSource = TableViewDataSource(tableView: tableView, person: person!)
    }
    
    func configureNavigationItem() {
        titleNavigationItem.title = person?.name
    }
    
}
