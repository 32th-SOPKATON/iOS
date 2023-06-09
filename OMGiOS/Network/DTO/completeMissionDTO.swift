//
//  completeMissionDTO.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/21.
//

struct completeMissionDTO: Codable {
    let code: Int?
    let success: Bool?
    let message: String?
    let data: [completeMissionData]?
}

struct completeMissionData: Codable {
    let missionId: Int?
    let missoionTitle: String?
}
