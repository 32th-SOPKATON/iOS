//
//  HomeCollectionViewCell.swift
//  OMGiOS
//
//  Created by Joon Baek on 2023/05/21.
//

import UIKit

import SnapKit

final class MyCollectionViewCell: UICollectionViewCell {
    
    private let missionImageView = UIImageView(image: ImageLiterals.mission)
    
    private let missionLabel: UILabel = {
        let label = UILabel()
        label.text = "아이에게 우리의 가족 배경을 어떻게 설명할 지 고민해 보기!"
        label.numberOfLines = 3
        label.font = .body1Bold()
        return label
    }()
    
    private let howToImageView = UIImageView(image: ImageLiterals.howTo)
    
    private let howToLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .body1Medium()
        label.text = "1) 내 상황을 노트로 적어 봐요.\n 2) 어느 시기에 말을 하면 좋을까요? \n 3) 어떤 방식으로 말을 할까요? \n 4) 솔직함이 tip!"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset the state of the cell here
    }

}

extension MyCollectionViewCell {
    
    private func setLayout() {
        
        contentView.adds([missionImageView, missionLabel, howToImageView, howToLabel ])

        missionImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        missionLabel.snp.makeConstraints {
            $0.top.equalTo(missionImageView.snp.bottom).offset(8)
            $0.leading.equalTo(missionImageView)
            $0.trailing.equalToSuperview().inset(28)
        }
        
        howToImageView.snp.makeConstraints {
            $0.top.equalTo(missionLabel.snp.bottom).offset(45)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
            $0.leading.equalTo(missionImageView)
        }
        
        howToLabel.snp.makeConstraints {
            $0.top.equalTo(howToImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(missionLabel)
        }
    }
}
