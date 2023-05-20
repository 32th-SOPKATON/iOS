//
//  ResponseData.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import Foundation

@frozen
enum ResponseData {
    case getTodayMissionAPI
    case postTodayMissionAPI
    case getMissionListAPI
    case postMissionFinishAPI
}
