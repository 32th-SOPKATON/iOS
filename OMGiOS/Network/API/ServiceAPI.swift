//
//  ServiceAPI.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import Foundation

import Alamofire

final class ServiceAPI: ServiceProtocol {
    
    static var serviceAPI = ServiceAPI()
    
    func getCompleteMissionCountAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + "/mission/ing"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "userId" : "1"
        ]

        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, responseData: .getCompleteMissionCountAPI)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getMissionListAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + "/mission"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "userId" : "1"
        ]

        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, responseData: .getMissionListAPI)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func postTodayMissionAPI(
        missionID: Int,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + "/mission/"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : "1"
        ]
        let body: Parameters = [
            "missionId": missionID
        ]

        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, responseData: .postTodayMissionAPI)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getCompleteMissionListAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + "/mission/done"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : "1"
        ]

        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, responseData: .getCompleteMissionListAPI)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func postMissionFinishAPI(
        missionID: Int,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + "/mission/complete/"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : "1"
        ]
        let body: Parameters = [
            "missionId": missionID
        ]

        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, responseData: .postMissionFinishAPI)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getTodayMissionAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + "/mission/ing"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : "1"
        ]

        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, responseData: .getTodayMissionAPI)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }

    func judgeStatus(
        by statusCode: Int, _ data: Data,
        responseData: ResponseData
    ) -> NetworkResult<Any> {
        print("statusCode: ", statusCode)
        switch statusCode {
        case 200..<300:
            return isValidData(data: data, responseData: responseData)
        case 400..<500:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    func isValidData(
        data: Data,
        responseData: ResponseData
    ) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        switch responseData {
        case .getCompleteMissionCountAPI:
            guard let decodedData = try? decoder.decode(missionCardsDTO.self, from: data) else {
                return .pathErr
            }
            return .success(decodedData)
        case .getMissionListAPI:
            guard let decodedData = try? decoder.decode(missionRecordDTO.self, from: data) else {
                return .pathErr
            }
            return .success(decodedData)
        case .postTodayMissionAPI:
            return .success((Any).self)
        case .getCompleteMissionListAPI:
            guard let decodedData = try? decoder.decode(completeMissionDTO.self, from: data) else {
                return .pathErr
            }
            return .success(decodedData)
        case .postMissionFinishAPI:
            return .success((Any).self)
        case .getTodayMissionAPI:
            guard let decodedData = try? decoder.decode(searchTodayMissionDTO.self, from: data) else {
                return .pathErr
            }
            return .success(decodedData)
        }
    }
}
