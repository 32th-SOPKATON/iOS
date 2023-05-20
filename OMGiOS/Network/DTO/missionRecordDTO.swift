//
//  missionRecordDTO.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/21.
//

import Foundation

struct missionRecordDTO: Codable {
    let code: Int?
    let success: Bool?
    let message: String?
    let data: [missionRecordData]?
}

struct missionRecordData: Codable {
    let missionId: Int?
    let missoionTitle: String?
    let missionContent: String?
}
