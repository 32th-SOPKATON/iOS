//
//  MissionRecordTableViewController.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/21.
//

import UIKit
import SnapKit

class MissionRecordTableViewController: UITableViewController {
    
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

private extension MissionRecordTableViewController {
    
    func setStyle() {
        
    }
    func setLayout() {
        view.adds([missionRecordTitleLabel, todayMissionLabel, missionRecordTableView])
        
    }
}
