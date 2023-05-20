//
//  MissionRecordTableViewController.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/21.
//

import UIKit
import SnapKit

class MissionRecordViewController: UIViewController {
    
    private let missionRecordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "지난 기록을 볼 수 있는 곳이에요."
        return label
    }()

    private let todayMissionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let missionRecordTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(MissionRecordTableViewCell.self, forCellReuseIdentifier: MissionRecordTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
}

private extension MissionRecordViewController {
    
    func setStyle() {
        
        
    }
    func setLayout() {
        view.adds([missionRecordTitleLabel, todayMissionLabel, missionRecordTableView])
        
        missionRecordTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
        }
        
        todayMissionLabel.snp.makeConstraints {
            $0.top.equalTo(missionRecordTitleLabel.snp.bottom).offset(24)
        }
        
        missionRecordTableView.snp.makeConstraints {
            $0.top.equalTo(todayMissionLabel.snp.bottom).offset(32)
        }
    }
}
