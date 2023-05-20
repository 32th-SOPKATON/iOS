//
//  TodayMissionViewController.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/20.
//

import UIKit

import SnapKit

class MyViewController: UIViewController {
    
    private let selectLabel: UILabel = {
        let label = UILabel()
        label.font = .display()
        label.text = "보연님! 오늘의 미션을 선택해 볼까요?"
        label.numberOfLines = 0
        label.asColor(targetString: "보연님!", color: .main1)
        return label
    }()
    
    private let myTopView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .main1
        button.titleLabel?.font = .body2Bold()
        button.setTitle("미션 선택하기", for: .normal)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = CarouselCollectionViewLayout()
        layout.itemSize = CGSize(width: 273, height: 362)
//        layout.minimumInteritemSpacing = 24
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        view.backgroundColor = .clear
        return view
    }()
    
// MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = false
//        navigationController?.navigationBar.backgroundColor = .white
        
        setUI()
        setLayout()
    }
}

// MARK: - UICollectionViewDelegate

extension MyViewController {
    
    private func setUI() {
        view.backgroundColor = .g_100
        
        selectButton.layer.cornerRadius = 12
    }
    
    private func setLayout() {
        view.adds([myTopView, collectionView, selectButton])
        
        myTopView.addSubview(selectLabel)
        
        myTopView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(160+45)
        }
        
        selectLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64+45)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-115)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(myTopView.snp.bottom).offset(47)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(362)
        }
        
        selectButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(56)
            $0.height.equalTo(44)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension MyViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
    
}

// MARK: - UICollectionViewDataSource
extension MyViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell
        myCell.backgroundColor = UIColor.white
        myCell.layer.cornerRadius = 20
        myCell.layer.borderColor = UIColor.g_700.cgColor
        myCell.layer.borderWidth = 1
        return myCell
    }

}

extension UILabel {
    func asColor(targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attributedString
    }
}
