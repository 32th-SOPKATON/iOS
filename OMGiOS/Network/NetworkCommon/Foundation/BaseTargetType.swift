//
//  BaseTargetType.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {

    var baseURL: URL {
        return URL(string: BaseURLConstant.base)!
    }

    var headers: [String: String]? {
        let header = [
            "Content-Type": "application/json"
        ]
        return header
    }

    var sampleData: Data {
        return Data()
    }
}
