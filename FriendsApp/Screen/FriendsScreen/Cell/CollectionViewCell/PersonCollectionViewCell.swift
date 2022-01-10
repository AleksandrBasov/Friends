//
//  PersonCollectionViewCell.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/6/22.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {

    // - UI
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    // - ViewModel
    private let viewModel = FriendsViewModel()
    
    // - Register Cell
    static let reuseID = "PersonCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PersonCollectionViewCell",
                     bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func set(person: Person) {
        nameLbl.text = person.name
        ageLbl.text =  "Age: \(String(person.age!))"
        genderLbl.text = person.gender
        if person.gender == "female" {
            genderLbl.textColor = .systemPink
            imageView.image = #imageLiteral(resourceName: "second")
        } else {
            genderLbl.textColor = .systemBlue
            imageView.image = #imageLiteral(resourceName: "first")
        }
    }
    
}

// MARK: - Configure
private extension PersonCollectionViewCell {
    
    func configure() {
        shadowView.addShadow()
        imageView.addShadow()
    }

}
