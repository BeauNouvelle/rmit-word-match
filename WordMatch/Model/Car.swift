//
//  Car.swift
//  WordMatch
//
//  Created by Beau Nouvelle on 8/4/21.
//

import Foundation
import UIKit

enum Car: String, CaseIterable {
    case tesla, toyota, honda, skoda, hyundai, mercedes
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
}
