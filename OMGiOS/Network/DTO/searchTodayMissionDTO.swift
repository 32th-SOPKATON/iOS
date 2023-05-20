//
//  searchTodayMissionDTO.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/21.
//

struct searchTodayMissionDTO: Codable {
    let code: Int?
    let success: Bool?
    let message: String?
    let data: earchTodayMissionData?
}

struct earchTodayMissionData: Codable {
    let missionID: Int?
    let missionContent: String?
}
