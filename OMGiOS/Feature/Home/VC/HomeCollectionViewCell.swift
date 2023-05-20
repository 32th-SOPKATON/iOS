//
//  HomeCollectionViewCell.swift
//  OMGiOS
//
//  Created by Joon Baek on 2023/05/21.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset the state of the cell here
    }

}

