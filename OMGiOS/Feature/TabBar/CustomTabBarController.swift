//
//  CustomTabBarController.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/20.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    // MARK: - Property
    
    
    // MARK: - UI Property
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hiddenNavigationBar()
    }
    
    // MARK: - Setting
    
    private func setStyle() {
        self.tabBar.backgroundColor = .black
    }
    
    private func setViewController() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "star.fill"), tag: 0)
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.setNavigationBarHidden(true, animated: true)

        let todayMissionViewController = TodayMissionViewController()
        todayMissionViewController.tabBarItem = UITabBarItem(title: "오늘 미션", image: UIImage(systemName: "star.fill"), tag: 0)
        let todayMissionNavigationController = UINavigationController(rootViewController: todayMissionViewController)


        let historyViewController = TodayMissionViewController()
        historyViewController.tabBarItem = UITabBarItem(title: "지난 기록", image: UIImage(systemName: "star.fill"), tag: 0)
        let historyNavigationController = UINavigationController(rootViewController: historyViewController)


        viewControllers = [homeNavigationController,
                           todayMissionNavigationController,
                           historyNavigationController]
    }
    
    
    // MARK: - Action Helper
    
    
    // MARK: - Custom Method
    
    private func hiddenNavigationBar() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
