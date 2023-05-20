//
//  SecondViewController.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/21.
//

import UIKit

import SnapKit

final class SecondViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "감사해요!\n본인, 자녀 나이를 알려주세요!"
        label.numberOfLines = 2
        label.font = .display()
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "미션 카드 제공에 활용될 예정이에요."
        label.font = .subHead()
        return label
    }()
    
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "본인 나이"
        label.font = .headLine()
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.placeholder = "나이를 입력해주세요."
        textField.layer.borderWidth = 1
        textField.setLeftPadding(amount: 16)
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    let childTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "자녀 나이"
        label.font = .headLine()
        return label
    }()
    
    let childTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.placeholder = "나이를 입력해주세요."
        textField.layer.borderWidth = 1
        textField.setLeftPadding(amount: 16)
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .main1
        button.setTitle("다음단계", for: .normal)
        button.titleLabel?.font = .headLine()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.addTarget(
            self,
            action: #selector(setNextButtonEvent),
            for: .touchUpInside
        )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        config()
    }
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func render() {
        view.adds([
            titleLabel,
            subTitleLabel,
            nameTitleLabel,
            nameTextField,
            childTitleLabel,
            childTextField,
            nextButton
        ])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(109)
            $0.leading.equalToSuperview().offset(20)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nameTitleLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(64)
            $0.leading.equalToSuperview().offset(20)
            
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        childTitleLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(20)
        }
        
        childTextField.snp.makeConstraints {
            $0.top.equalTo(childTitleLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(childTextField.snp.bottom).offset(137)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    @objc
    private func setNextButtonEvent() {
        let nextVC = CustomTabBarController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
