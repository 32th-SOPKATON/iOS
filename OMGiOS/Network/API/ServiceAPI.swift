//
//  ServiceAPI.swift
//  OMGiOS
//
//  Created by 홍준혁 on 2023/05/20.
//

import Foundation

import Alamofire

final class ServiceAPI: ServiceProtocol {
    func getTodayMissionAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + ""
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

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
    
    func postTodayMissionAPI(
        missionID: Int,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + ""
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

        let dataRequest = AF.request(url,
                                     method: .post,
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
    
    func getMissionListAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + ""
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

        let dataRequest = AF.request(url,
                                     method: .post,
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
    
    func postMissionFinishAPI(
        missinID: Int,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = BaseURLConstant.base + ""
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

        let dataRequest = AF.request(url,
                                     method: .post,
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

    func judgeStatus(by statusCode: Int, _ data: Data, responseData: ResponseData) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
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

    func isValidData(data: Data, responseData: ResponseData) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        switch responseData {
        case .getTodayMissionAPI:
            guard let decodedData = try? decoder.decode([String].self, from: data) else {
                return .pathErr
            }
            return .success(decodedData)
        case .postTodayMissionAPI: return .success((Any).self)
        case .getMissionListAPI:
            guard let decodedData = try? decoder.decode([String].self, from: data) else {
                return .pathErr
            }
            return .success(decodedData)
        case .postMissionFinishAPI: return .success((Any).self)
        }
    }
}
