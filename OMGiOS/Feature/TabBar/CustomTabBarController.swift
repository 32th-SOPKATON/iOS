//
//  CustomTabBarController.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/20.
//

import UIKit

import SnapKit

final class CustomTabBarController: UITabBarController {
    
    fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()
    
    let firstVC = MyViewController()
    let secondVC = HomeViewController()
    let thirdVC = HistoryViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setUpTabBar()
        setNavigation()
        selectedIndex = 1
    }
    
    private func setUpTabBar(){
        self.tabBar.tintColor = .main1
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white

        firstVC.title = "오늘 미션"
        secondVC.title = "홈"
        thirdVC.title = "지난 기록"

        let ViewControllers:[UIViewController] = [firstVC,secondVC,thirdVC]
        self.setViewControllers(ViewControllers, animated: true)

        firstVC.tabBarItem.image = UIImage(systemName: "rectangle.on.rectangle")
        secondVC.tabBarItem.image = ImageLiterals.tab
        thirdVC.tabBarItem.image = UIImage(systemName: "folder")
        
        self.hidesBottomBarWhenPushed = false
        viewWillLayoutSubviews()
    }
    
    private func setNavigation() {
        self.navigationItem.hidesBackButton = true
    }
}
