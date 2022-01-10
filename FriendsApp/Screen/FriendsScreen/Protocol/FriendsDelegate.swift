//
//  FriendsDelegate.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/9/22.
//

import UIKit

protocol FriendsDelegate: AnyObject {
    func performSegue()
    func scrollViewWillBeginDragging()
}
