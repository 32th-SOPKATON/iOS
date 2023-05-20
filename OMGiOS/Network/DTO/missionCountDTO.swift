//
//  missionCountDTO.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/21.
//

struct missionCountDTO: Codable {
    let code: Int?
    let success: Bool?
    let message: String?
    let data: missionCountData?
}

struct missionCountData: Codable {
    let completeCount: Int?
}
