//
//  FriendsVC.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/6/22.
//

import UIKit

class FriendsVC: UIViewController {

    // - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var ageSegmentControl: UISegmentedControl!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // - DataSource
    private var dataSource: CollectionViewDataSource?
    
    // - ViewModel
    private let viewModel = FriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
 
}

// MARK: - Action
private extension FriendsVC {
   
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            stackView.isHidden = false
        case 1:
            stackView.isHidden = true
            viewModel.fetchData()
            collectionView.reloadData()
        case 2:
            stackView.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func ageSegmentControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            viewModel.userResponse.sort(by: { $0.age! > $1.age! })
            collectionView.reloadData()
        case 1:
            viewModel.userResponse.sort(by: { $0.age! < $1.age! })
            collectionView.reloadData()
        default:
            break
        }
    }
    
    @IBAction func genderSegmentControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            viewModel.fetchData()
            viewModel.sort(name: "female")
            collectionView.reloadData()
        case 1:
            viewModel.fetchData()
            viewModel.sort(name: "male")
            collectionView.reloadData()
        default:
            break
        }
    }
    
}

// MARK: - PhotoGalleryDelegate
extension FriendsVC: FriendsDelegate {
    
    func performSegue() {
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func scrollViewWillBeginDragging() {
        self.searchBar.endEditing(true)
        
    }
    
}

// MARK: - viewWillTransition
extension FriendsVC {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.reloadData()
    }
    
}

// MARK: - prepareForSegue
extension FriendsVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? UserVC {
            if let paths = collectionView?.indexPathsForSelectedItems {
                let row = paths[0].row
                detailVC.person = viewModel.userResponse[row]
            }
        }
    }
    
}

//MARK: - SearchBar
extension FriendsVC: UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchData()
        viewModel.filter(searchText: searchText)
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }

}

// MARK: - configure
private extension FriendsVC {
    
    func configure() {
        makeRequest()
        configureDataSource()
        configureSearchBar()
    }
    
    func makeRequest() {
        viewModel.fetchData()
    }
    
    func configureDataSource() {
        dataSource = CollectionViewDataSource(collectionView: collectionView, viewModel: viewModel)
        dataSource?.delegate = self
    }
    
    func  configureSearchBar() {
        searchBar.delegate = self
    }
    
}
