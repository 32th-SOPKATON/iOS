//
//  missionRecordViewController.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/21.
//

import UIKit

class missionRecordViewController : UIViewController {
    
    private let missionRecordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "지난 기록을 볼 수 있는 곳이에요."
        return label
    }()
    
    private let todayMissionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
}
