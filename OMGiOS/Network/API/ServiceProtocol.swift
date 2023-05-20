//
//  ServiceProtocol.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import UIKit

protocol ServiceProtocol {
    func getTodayMissionAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    )
    func postTodayMissionAPI(
        missionID: Int,
        completion: @escaping (NetworkResult<Any>) -> Void
    )
    func getMissionListAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    )
    func postMissionFinishAPI(
        missinID: Int, completion: @escaping (NetworkResult<Any>) -> Void
    )
}
