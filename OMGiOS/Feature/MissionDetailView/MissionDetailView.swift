//
//  MissionDetailView.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/21.
//

import UIKit

import SnapKit

final class MissionDetailView: BaseView {
    
    let contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.g_300.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 3
        return view
    }()
    let rateView = RateView()
    let missionDetailTextView = MissionDetailTextView()
    
    let recordLabel: UILabel = {
        let label = UILabel()
        label.text = "느낀점 기록"
        label.font = .caption()
        label.textColor = .g_700
        return label
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.darkGray
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.font = .body1Medium()
        textView.layer.cornerRadius = 12
        textView.layer.borderColor = UIColor.g_100.cgColor
        textView.layer.borderWidth = 2
        return textView
    }()
    
    let finishedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .g_100
        button.layer.cornerRadius = 12
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = .body2Bold()
        button.setTitleColor(.g_600, for: .normal)
        return button
    }()
    
    override func configure() {
        self.addSubview(contentsView)
        contentsView.adds([
            missionDetailTextView,
            recordLabel,
            rateView,
            textView,
            finishedButton
        ])
        
        contentsView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(72)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(200)
        }
        
        missionDetailTextView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(56)
        }
        
        recordLabel.snp.makeConstraints {
            $0.top.equalTo(missionDetailTextView.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(28)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(recordLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(111)
        }
        
        rateView.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(44)
        }
        
        finishedButton.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.bottom.equalToSuperview().inset(26)
        }
    }
}

