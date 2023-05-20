//
//  HomeViewController.swift
//  OMGiOS
//
//  Created by Joon Baek on 2023/05/21.
//

import UIKit

final class HomeViewController: UIViewController {

    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "보연님!\n미션 카드를 선택해보세요."
        label.numberOfLines = 2
        label.font = .display()
        return label
    }()
    
    let grapImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.grap
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        config()
        render()
        setTitleLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTeamInfoFromServer { result in
            print(result)
        }
        getMissionListAPI { result in
            print(result)
        }
    }
    
    private func setTitleLabel() {
        if let text = titleLabel.text {
            let attributeString = NSMutableAttributedString(string: text)
            attributeString.addAttribute(.foregroundColor, value: UIColor.main1, range: (text as NSString).range(of: "보연"))
            titleLabel.attributedText = attributeString
        }
    }
    
    private func config() {
        view.backgroundColor = .g_100
    }
    
    private func render() {
        view.addSubview(topView)
        view.addSubview(grapImage)
        topView.addSubview(titleLabel)
        
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.leading.equalToSuperview().offset(20)
        }
        
        grapImage.snp.makeConstraints {
            $0.width.equalTo(284)
            $0.height.equalTo(443)
            $0.center.equalToSuperview()
        }
    }
}

// MARK: - API

extension HomeViewController {
    func getTeamInfoFromServer(
        completion: @escaping (missionCountDTO) -> Void
    ) {
        ServiceAPI.serviceAPI.getCompleteMissionCountAPI { result in
            switch result {
            case .success(let response):
                guard let team = response as? missionCountDTO else { return }
                completion(team)
            case .requestErr(let errResponse):
                dump(errResponse)
            default:
                print("error")
            }
        }
    }
    
    func getMissionListAPI(
        completion: @escaping (missionRecordDTO) -> Void
    ) {
        ServiceAPI.serviceAPI.getMissionListAPI() { result in
            switch result {
            case .success(let response):
                guard let team = response as? missionRecordDTO else { return }
                completion(team)
            case .requestErr(let errResponse):
                dump(errResponse)
            default:
                print("error")
            }
        }
    }
}
