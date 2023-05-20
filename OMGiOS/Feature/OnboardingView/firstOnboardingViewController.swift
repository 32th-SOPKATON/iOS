//
//  firstOnboardingViewController.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/21.
//

import UIKit

import SnapKit

final class firstOnboardingViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "반가워요!\n성함과 성별을 알려주세요!"
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
        label.text = "이름"
        label.font = .headLine()
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.placeholder = "이름을 입력해주세요."
        textField.layer.borderWidth = 1
        textField.setLeftPadding(amount: 16)
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    let sexTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "성별"
        label.font = .headLine()
        return label
    }()
    
    let momButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.setImage(ImageLiterals.mom, for: .normal)
        return button
    }()
    
    let papaButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.setImage(ImageLiterals.papa, for: .normal)
        return button
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
        setNavigationItem()
    }
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func setNavigationItem() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func render() {
        
        view.adds([
            titleLabel,
            subTitleLabel,
            nameTitleLabel,
            nameTextField,
            sexTitleLabel,
            momButton,
            papaButton,
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
        
        sexTitleLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(20)
        }
        
        momButton.snp.makeConstraints {
            $0.top.equalTo(sexTitleLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(163)
            $0.height.equalTo(99)
        }
        
        papaButton.snp.makeConstraints {
            $0.top.equalTo(sexTitleLabel.snp.bottom).offset(18)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(163)
            $0.height.equalTo(99)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(papaButton.snp.bottom).offset(98)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    @objc
    private func setNextButtonEvent() {
        let nextVC = SecondViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
