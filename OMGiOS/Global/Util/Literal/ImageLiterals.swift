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
    static var grap: UIImage { .load(name: "grap") }
    static var tab: UIImage { .load(name: "tab") }
    
    
    static var clap: UIImage { .load(name: "clapIcon") }
    static var great: UIImage { .load(name: "greatIcon") }
    static var heartFill: UIImage { .load(name: "heart.fill") }
    static var heartNotFill: UIImage { .load(name: "heart") }
    static var howTo: UIImage { .load(name: "HowTO") }
    static var mission: UIImage { .load(name: "mission") }
    static var putch: UIImage { .load(name: "putchIcon") }
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
