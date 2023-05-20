//
//  MissionDetailTextView.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/21.
//

import UIKit

import SnapKit

final class MissionDetailTextView: BaseView {
    
    let contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "아이에게 우리의 가족 배경을 어떻게\n설명할 지 고민해 보기!"
        title.numberOfLines = 2
        title.font = .body2Bold()
        title.textColor = .g_700
        title.textAlignment = .center
        return title
    }()
    
    override func configure() {
        self.addSubview(contentsView)
        contentsView.addSubview(title)
        
        contentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
