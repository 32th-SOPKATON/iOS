//
//  HistoryViewController.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/20.
//
import UIKit
import SnapKit

class HistoryViewController: UIViewController {
    
    private let dummy = MissionRecord.dummy()
    
    private let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let missionRecordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 미션을 통해\n한 걸음 한 걸음 성장해 봐요."
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.display()
        //label.backgroundColor = .white
        return label
    }()

    private let todayMissionLabel: UILabel = {
        let label = UILabel()
        label.text = "      오늘 미션"
        label.backgroundColor = .g_100
        label.font = UIFont.headLine()
        return label
    }()
    
    private let labelView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.g_300.withAlphaComponent(0.5).cgColor
        return view
    }()
    
    private let todayMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "두근두근 다음 미션은?"
        label.font = UIFont.body1Medium()
        label.textColor = .g_600
        return label
    }()
    
    private let missionRecordTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableview.tableHeaderView = MissionRecordHeaderView()
        tableview.rowHeight = 78
        tableview.tableHeaderView?.frame.size.height = 80
        tableview.backgroundColor = .g_100
        tableview.showsVerticalScrollIndicator = false
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
        view.adds([titleView, todayMissionLabel, missionRecordTableView, labelView])
        titleView.addSubview(missionRecordTitleLabel)
        labelView.addSubview(todayMessageLabel)
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
        }
        missionRecordTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalToSuperview().offset(64)
        }
        
        todayMissionLabel.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        labelView.snp.makeConstraints {
            $0.height.equalTo(95)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(todayMissionLabel.snp.bottom)
        }
        
        todayMessageLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(37)
            $0.centerY.equalToSuperview()
        }
        
        missionRecordTableView.snp.makeConstraints {
            $0.top.equalTo(labelView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
                
        return cell
    }
        
    
}
