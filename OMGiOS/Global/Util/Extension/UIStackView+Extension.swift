//
//  UIStackView+Extension.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
