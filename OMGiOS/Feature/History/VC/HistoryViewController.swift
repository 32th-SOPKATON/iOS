//
//  HistoryViewController.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/20.
//
import UIKit
import SnapKit

class HistoryViewController: UIViewController {
    
    private let missionRecordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "지난 기록을\n볼 수 있는 곳이에요."
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    private let todayMissionLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 미션"
        label.textAlignment = .center
        return label
    }()
    
    
    private let missionRecordTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableview.tableHeaderView = MissionRecordHeaderView()
        tableview.tableHeaderView?.frame.size.height = 30
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
}

private extension HistoryViewController {
    
    func setStyle() {
        view.backgroundColor = .white
        
        missionRecordTableView.dataSource = self
        
    }
    func setLayout() {
        view.adds([missionRecordTitleLabel, todayMissionLabel, missionRecordTableView])
        
        missionRecordTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        todayMissionLabel.snp.makeConstraints {
            $0.top.equalTo(missionRecordTitleLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        missionRecordTableView.snp.makeConstraints {
            $0.top.equalTo(todayMissionLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }
                
        return cell
    }
        
    
}
