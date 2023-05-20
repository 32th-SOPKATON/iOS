//
//  BaseView.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/21.
//

import Foundation

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {}
    func bind() {}
}
