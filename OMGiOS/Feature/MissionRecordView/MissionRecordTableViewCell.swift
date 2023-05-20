//
//  MissionRecordTableViewCell.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/21.
//

import UIKit
import SnapKit

class MissionRecordTableViewCell: UITableViewCell {
    
    static let identifier = "MissionRecordTableViewCell"

        private let missionRecordLabel: UILabel = {
            let label = UILabel()
            label.text = "지난미션 테이블뷰셀"
            label.textAlignment = .center
            return label
        }()

        private let missionResultImageView: UIImageView = {
            let image = UIImageView()
            return image
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setStyle()
            setLayout()
        }

        @available(*, unavailable)
            required init?(coder: NSCoder) {
                super.init(coder: coder)
            }
}

private extension MissionRecordTableViewCell {
    
    func setStyle() {
        [missionRecordLabel, missionResultImageView]
            .forEach { contentView.addSubview($0) }
    }
    
    func setLayout() {
        
        missionRecordLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        missionResultImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(missionRecordLabel.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(44)
        }
    }
    
    // func configureCell 만들어야해 4차 과제 확인하자
}
