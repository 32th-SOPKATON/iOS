//
//  missionRecordDTO.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/20.
//

struct missionRecordDTO: Codable {
    let code: Int?
    let success: Bool?
    let message: String?
    let data: [missionRecordData]?
}

struct missionRecordData: Codable {
    let missionID: Int?
    let missionContent: String?
}
