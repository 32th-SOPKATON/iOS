//
//  FontLiterals.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/21.
//

import UIKit

extension UIFont {
    
    static func display() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 28)!
    }

    static func headLine() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 20)!
    }

    static func subHead() -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: 18)!
    }

    static func body2Bold() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 16)!
    }

    static func body2Medium() -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: 16)!
    }

    static func body1Bold() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 14)!
    }

    static func body1Medium() -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: 14)!
    }
    
    static func caption() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 12)!
    }
    
    static func smallCaption() -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: 10)!
    }
}
