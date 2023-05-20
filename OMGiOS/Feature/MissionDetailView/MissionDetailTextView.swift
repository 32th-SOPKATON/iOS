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
        view.backgroundColor = .red
        return view
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "asdfwefwefwef"
        title.font = UIFont(name: "Avenir-Black", size: 17)
        return title
    }()
    
    override func configure() {
        self.addSubview(contentsView)
        contentsView.addSubview(title)
        
        contentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
