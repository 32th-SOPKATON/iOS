//
//  MissionDetailViewController.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/21.
//

import UIKit

import SnapKit

final class MissionDetailViewController: UIViewController {
    
    let missionDetailView = MissionDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        config()
    }
    
    private func config() {
        view.backgroundColor = .g_100
    }
    
    private func render() {
        view.addSubview(missionDetailView)
        
        missionDetailView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(89)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(62)
        }
    }
    
    private func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-50, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.blue
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

