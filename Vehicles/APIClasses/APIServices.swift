//
//  APIServices.swift
//  Vehicles
//
//  Created by Ajay Gabani on 17/11/22.
//

import Foundation
import Alamofire

struct APIServices {
    public static let shared = APIServices()

    func callGetVehiclesList(size: Int32? = nil, parameters: Parameters? = nil, success: @escaping (_ result: [Vehicle]?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        let strURL = "https://random-data-api.com/api/vehicle/random_vehicle?size="+"\(size ?? 1)"
        
        APIManager.shared.callAPI(strURL: strURL, queryItems: nil, method: .get, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let createResponse = try JSONDecoder().decode([Vehicle].self, from: data)
                    success(createResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
}
