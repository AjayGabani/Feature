//
//  VehiclesTests.swift
//  VehiclesTests
//
//  Created by Ajay Gabani on 17/11/22.
//

import XCTest
@testable import Vehicles

class VehiclesTests: XCTestCase {

    var sut: VehicleViewModel!
    
    override func setUpWithError() throws {
        sut = VehicleViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCheckVehicleNumberRange() {
        XCTAssertEqual(sut.maxRangeForList, 100)
        XCTAssertEqual(sut.minRangeForList, 1)
    }

    func testCalculateEstimatedCarbonEmissionForFirst5000Km() {
        let kilometers = 200
        let estimatedCarbonEmission = Double(kilometers)*1.0
        XCTAssertEqual(sut.calculateEstimatedCarbonEmission(kilometrage: kilometers), estimatedCarbonEmission)
    }
    
    func testCalculateEstimatedCarbonEmissionForAfter5000Km() {
        let kilometers = 8276
        var estimatedCarbonEmission = 5000*1.0
        let kmAfter5000 = kilometers - 5000
        
        estimatedCarbonEmission = estimatedCarbonEmission + (Double(kmAfter5000)*1.5)
        XCTAssertEqual(sut.calculateEstimatedCarbonEmission(kilometrage: kilometers), estimatedCarbonEmission)
    }
}
