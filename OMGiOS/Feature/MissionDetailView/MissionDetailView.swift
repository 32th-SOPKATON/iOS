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
        view.backgroundColor = .gray
        return view
    }()
    let rateView = RateView()
    let missionDetailTextView = MissionDetailTextView()
    let textView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.darkGray
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Avenir-Black", size: 12)
        return textView
    }()
    let finishedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    override func configure() {
        self.addSubview(contentsView)
        contentsView.adds([
            missionDetailTextView,
            rateView,
            textView,
            finishedButton
        ])
        
        contentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        missionDetailTextView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(206)
        }
        
        rateView.snp.makeConstraints {
            $0.top.equalTo(missionDetailTextView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(57)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(rateView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(159)
        }
        
        finishedButton.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(45)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(52)
        }
    }
}

