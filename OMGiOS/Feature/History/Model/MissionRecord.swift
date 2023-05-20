//
//  MissionRecord.swift
//  OMGiOS
//
//  Created by 홍유정 on 2023/05/21.
//

import UIKit

struct MissionRecord {
    let image: UIImage
    let missionHistory: String
    let recordDate: String
}

extension MissionRecord {
    
    static func dummy() -> [MissionRecord] {
        return [MissionRecord(image: ImageLiterals.clap,
                       missionHistory: "집 안에서 10분 운동하기",
                       recordDate: "05.12"),
                MissionRecord(image: ImageLiterals.great,
                               missionHistory: "나와 아이의 장기적인 미래에 대해 고민...",
                               recordDate: "05.11"),
                MissionRecord(image: ImageLiterals.putch,
                               missionHistory: "내가 좋아하는 분야의 책 5p 읽기",
                               recordDate: "05.10"),
                MissionRecord(image: ImageLiterals.great,
                               missionHistory: "내가 상처를 받았던 사회적인 시선에 대해...",
                               recordDate: "05.09"),
                MissionRecord(image: ImageLiterals.clap,
                               missionHistory: "햇빛 10분 받기",
                               recordDate: "05.08"),
                MissionRecord(image: ImageLiterals.putch,
                               missionHistory: "부모 공부 10분 하기",
                               recordDate: "05.07"),
                MissionRecord(image: ImageLiterals.great,
                               missionHistory: "오늘 나에게 편지 쓰기",
                               recordDate: "05.06"),
                MissionRecord(image: ImageLiterals.putch,
                               missionHistory: "아이에게 편지 쓰기",
                               recordDate: "05.05"),
                MissionRecord(image: ImageLiterals.great,
                               missionHistory: "혼자이기에 더 좋은 점 노트에 정리해 보기",
                               recordDate: "05.04"),
                MissionRecord(image: ImageLiterals.great,
                               missionHistory: "혼자이기에 생기는 결핍을 노트에 정리해...",
                               recordDate: "05.03"),
                MissionRecord(image: ImageLiterals.clap,
                               missionHistory: "밖에서 아이가 상처 받는 말을 들었...",
                               recordDate: "05.02"),


                
                

        ]
    }
}

