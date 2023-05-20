//
//  UIView+Extension.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import UIKit

extension UIView {
    
    @discardableResult
    func adds<T: UIView>(_ subviews: [T], then closure: (([T]) -> Void)? = nil) -> [T] {
        subviews.forEach { addSubview($0) }
        closure?(subviews)
        return subviews
    }
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}

