//
//  ImageLiterals.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import UIKit

enum ImageLiterals {
    
    static var mom: UIImage { .load(name: "mom") }
    static var papa: UIImage { .load(name: "papa") }
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
}
