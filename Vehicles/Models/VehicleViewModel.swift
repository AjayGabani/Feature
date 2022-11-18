//
//  VehicleViewModel.swift
//  Vehicles
//
//  Created by Ajay Gabani on 17/11/22.
//

import Foundation
import SwiftUI

class VehicleViewModel {
    @Published var vehicleListSize: String = "1"
    var error: ObservableObject<String?> = ObservableObject(nil)
    var arrVehiclesList: [Vehicle]!
    func getVehiclesList(size: Int32) {
        APIServices.shared.callGetVehiclesList(size: size, success: { result in
            if let response = result {
                if response.count == 0 {
                    self.error.value = "No car found!!!"
                    return
                }
                
                self.arrVehiclesList = response
                self.error.value = nil
            }
        }, failure: { failureMsg in
            self.error.value = failureMsg
        })
    }
}

struct getVehicleListRequest: Codable {
    var size: Int32?
    var is_xml: Bool?
}
