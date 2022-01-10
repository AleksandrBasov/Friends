//
//  SecondTableViewCell.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/9/22.
//

import UIKit
import MapKit

class SecondTableViewCell: UITableViewCell {

    // - UI
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shadowView: UIView!
    
    // - Register Cell
    static let reuseID = "SecondTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell",
                     bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func set(person: Person) {
        companyLbl.text = "Company: \(String(person.company!))"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: person.registered!)!

        dateFormatter.dateFormat = nil
        dateFormatter.dateFormat = "dd.MM.yyyy' at 'HH:mm"
        let local = dateFormatter.string(from: date)
        
        dateLbl.text = "Registration: \(local)"
       
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(person.latitude!), longitude: Double(person.longitude!))
        mapView.region.center = annotation.coordinate
        self.mapView.addAnnotation(annotation)
    }
    
}

// MARK: - Configure
private extension SecondTableViewCell {
    
    func configure() {
        shadowView.addShadow()
        mapView.addShadow()
        companyLbl.textColor = .systemPurple
    }
    
}
