//
//  newMissionDTO.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/20.
//

struct missionCardsDTO: Codable {
    let code: Int?
    let success: Bool?
    let message: String?
    let data: [MissionCardsData]?
}

struct MissionCardsData: Codable {
    let missionId: Int?
    let missionContent: String?
}
