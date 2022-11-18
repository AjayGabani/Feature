//
//  APIManager.swift
//  Vehicles
//
//  Created by Ajay Gabani on 17/11/22.
//

import Foundation
import Alamofire

public typealias FailureMessage = String

public class APIManager {
    public static let shared = APIManager()

    func callAPI(strURL: String, queryItems: [URLQueryItem]? = nil, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, success: @escaping ((AFDataResponse<Any>) -> Void), failure: @escaping ((FailureMessage) -> Void)) {

        guard var url = URLComponents(string: strURL) else {
            failure("Invalid URL")
            return
        }

        if let queryItems = queryItems {
            url.queryItems = queryItems
        }

        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    success(response)
                case let .failure(error):
                    failure(error.localizedDescription)
                }
            }
    }
}
