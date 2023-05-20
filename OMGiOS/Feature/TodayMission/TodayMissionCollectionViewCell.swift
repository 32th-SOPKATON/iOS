//
//  HomeCollectionViewCell.swift
//  OMGiOS
//
//  Created by Joon Baek on 2023/05/21.
//

import UIKit

import SnapKit

final class MyCollectionViewCell: UICollectionViewCell {
    
    private let tagView: UIView = {
        let view = UIView()
        view.backgroundColor = .point
        return view
    }()
    
    private let missionLabel: 
    
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
