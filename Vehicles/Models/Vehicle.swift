//
//  Vehicle.swift
//
//  Created by Ajay Gabani on 17/11/22
//  Copyright (c) . All rights reserved.
//

import Foundation

class Vehicle: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case vin
    case transmission
    case mileage
    case carOptions = "car_options"
    case color
    case carType = "car_type"
    case licensePlate = "license_plate"
    case specs
    case doors
    case kilometrage
    case uid
    case fuelType = "fuel_type"
    case makeAndModel = "make_and_model"
    case driveType = "drive_type"
  }

  var id: Int?
  var vin: String?
  var transmission: String?
  var mileage: Int?
  var carOptions: [String]?
  var color: String?
  var carType: String?
  var licensePlate: String?
  var specs: [String]?
  var doors: Int?
  var kilometrage: Int?
  var uid: String?
  var fuelType: String?
  var makeAndModel: String?
  var driveType: String?

  init (id: Int?, vin: String?, transmission: String?, mileage: Int?, carOptions: [String]?, color: String?, carType: String?, licensePlate: String?, specs: [String]?, doors: Int?, kilometrage: Int?, uid: String?, fuelType: String?, makeAndModel: String?, driveType: String?) {
    self.id = id
    self.vin = vin
    self.transmission = transmission
    self.mileage = mileage
    self.carOptions = carOptions
    self.color = color
    self.carType = carType
    self.licensePlate = licensePlate
    self.specs = specs
    self.doors = doors
    self.kilometrage = kilometrage
    self.uid = uid
    self.fuelType = fuelType
    self.makeAndModel = makeAndModel
    self.driveType = driveType
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    vin = try container.decodeIfPresent(String.self, forKey: .vin)
    transmission = try container.decodeIfPresent(String.self, forKey: .transmission)
    mileage = try container.decodeIfPresent(Int.self, forKey: .mileage)
    carOptions = try container.decodeIfPresent([String].self, forKey: .carOptions)
    color = try container.decodeIfPresent(String.self, forKey: .color)
    carType = try container.decodeIfPresent(String.self, forKey: .carType)
    licensePlate = try container.decodeIfPresent(String.self, forKey: .licensePlate)
    specs = try container.decodeIfPresent([String].self, forKey: .specs)
    doors = try container.decodeIfPresent(Int.self, forKey: .doors)
    kilometrage = try container.decodeIfPresent(Int.self, forKey: .kilometrage)
    uid = try container.decodeIfPresent(String.self, forKey: .uid)
    fuelType = try container.decodeIfPresent(String.self, forKey: .fuelType)
    makeAndModel = try container.decodeIfPresent(String.self, forKey: .makeAndModel)
    driveType = try container.decodeIfPresent(String.self, forKey: .driveType)
  }

}
