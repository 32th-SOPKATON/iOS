//
//  UIColor.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import UIKit

extension UIColor {
    static var main1: UIColor {
        return UIColor(hex: "#5829CF")
    }
    static var main2: UIColor {
        return UIColor(hex: "#8361DB")
    }
    static var main3: UIColor {
        return UIColor(hex: "#AB94E7")
    }
    static var main4: UIColor {
        return UIColor(hex: "#D5C9F3")
    }
    static var point: UIColor {
        return UIColor(hex: "#FFC674")
    }
    static var white: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    static var g_100: UIColor {
        return UIColor(hex: "#F2F2F2")
    }
    static var g_300: UIColor {
        return UIColor(hex: "#CBD0D4")
    }
    static var g_500: UIColor {
        return UIColor(hex: "#838D95")
    }
    static var g_600: UIColor {
        return UIColor(hex: "#525A60")
    }
    static var g_700: UIColor {
        return UIColor(hex: "#25292C")
    }
    static var black: UIColor {
        return UIColor(hex: "#000000")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
