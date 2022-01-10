//
//  CollectionViewDataSource.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/6/22.
//

import UIKit

class CollectionViewDataSource: NSObject {
    
    // - TableView
    private var collectionView: UICollectionView
    
    // - ViewModel
    private var viewModel: FriendsViewModel
    
    // - Delegate
    weak var delegate: FriendsDelegate?
    
    init(collectionView: UICollectionView, viewModel: FriendsViewModel) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        super.init()
        configure()
    }
    
}

//MARK: - UICollectionViewDataSource
extension CollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.userResponse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return userCell(cellForItemAt: indexPath)
    }
    
}

//MARK: - Cell
private extension CollectionViewDataSource {
    
    func userCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.reuseID, for: indexPath) as! PersonCollectionViewCell
        cell.set(person: viewModel.userResponse[indexPath.row])
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension CollectionViewDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)  as? PersonCollectionViewCell
        collectionView.bringSubviewToFront(selectedCell!)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            selectedCell?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
        delegate?.performSegue()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let unselectedCell = collectionView.cellForItem(at: indexPath)  as? PersonCollectionViewCell
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            unselectedCell?.transform = .identity
        })
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegate?.scrollViewWillBeginDragging()
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewDataSource: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size 
    }

}

//MARK: - Configure
private extension CollectionViewDataSource {
    
    func configure() {
        registerCells()
        setupDataSource()
    }
    
    func setupDataSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func registerCells() {
        collectionView.register(PersonCollectionViewCell.nib(), forCellWithReuseIdentifier: PersonCollectionViewCell.reuseID)
    }
    
}
