//
//  MissionRecordHeaderView.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/21.
//

import UIKit

class MissionRecordHeaderView: UIView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "지난 미션"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

