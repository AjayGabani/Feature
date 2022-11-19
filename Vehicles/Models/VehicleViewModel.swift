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
    
    func sortArrVehiclesList(fieldName: String) -> [Vehicle] {
        if fieldName == "" {
            arrVehiclesList = arrVehiclesList?.sorted(by: {$0.vin! < $1.vin!})
        } else {
            arrVehiclesList = arrVehiclesList?.sorted(by: {$0.carType! < $1.carType!})
        }
        return arrVehiclesList
    }
    
    func isNumberValid(number: Int32) -> Bool {
        if number > 0 && number < 101 {
            return true
        }
        
        return false
    }
}

struct getVehicleListRequest: Codable {
    var size: Int32?
    var is_xml: Bool?
}
