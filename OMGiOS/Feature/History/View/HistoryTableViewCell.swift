//
//  HistoryTableViewCell.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/21.
//

import UIKit
import SnapKit

class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "HistoryTableViewCell"
    
    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let recordDateLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = .smallCaption()
        label.textAlignment = .center
        label.textColor = .g_500
        return label
    }()
    
    private let missionRecordLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = .body1Medium()
        label.textAlignment = .center
        label.textColor = .g_600
        return label
    }()
    
    private let missionResultImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Cell 간격 조정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
    }
    
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

private extension HistoryTableViewCell {
    
    
    
    func setStyle() {
        
        contentView.addSubview(cellView)
        
        cellView.adds([recordDateLabel, missionRecordLabel, missionResultImageView])
        
        self.layer.borderColor = UIColor.g_300.withAlphaComponent(0.5).cgColor
        self.layer.cornerRadius = 12
        self.backgroundColor = .g_100
        
    }
    
    func setLayout() {
        
        cellView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview().inset(1)
        }
        
        recordDateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(15)
        }
        
        missionRecordLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(recordDateLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(15)
        }
        
        missionResultImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            //$0.leading.equalTo(missionRecordLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(44)
        }
    }
    /*
     func configureCell(_ history: MissionRecord) {
     recordDateLabel.text = history.recordDate
     missionRecordLabel.text = history.missionHistory
     missionResultImageView.image = history.image
     }
     */
}
