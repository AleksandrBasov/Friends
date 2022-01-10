//
//  FirstTableViewCell.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/9/22.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    // - UI
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var adressLbl: UILabel!
    @IBOutlet weak var aboutLbl: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    // - Register Cell
    static let reuseID = "FirstTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FirstTableViewCell",
                     bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    func set(person: Person) {
        balanceLbl.text = person.balance
        emailLbl.text =  person.email
        phoneLbl.text = person.phone
        adressLbl.text = person.address
        aboutLbl.text = person.about
        if person.gender == "female" {
            photoView.image = #imageLiteral(resourceName: "second")
        } else {
            photoView.image = #imageLiteral(resourceName: "first")
        }
    }

}

// MARK: - Configure
private extension FirstTableViewCell {
    
    func configure() {
        shadowView.addShadow()
        photoView.addShadow()
        balanceLbl.textColor = .systemOrange
        aboutLbl.textColor = .systemGreen
        emailLbl.textColor = .systemRed
        phoneLbl.textColor = .systemBlue
        adressLbl.textColor = .systemTeal
    }
    
}
