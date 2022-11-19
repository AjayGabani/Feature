//
//  VehicleCarbonEmissionDetailsVC.swift
//  Vehicles
//
//  Created by Ajay Gabani on 19/11/22.
//

import UIKit

class VehicleCarbonEmissionDetailsVC: UIViewController {

    private var objCommonFunctions = CommonFunctions()
    var objVehicle: Vehicle!
    private var objVehicleViewModel = VehicleViewModel()
    
    @IBOutlet weak var viewMainContainer: UIView!
    @IBOutlet weak var lblTotalKilometrage: UILabel!
    @IBOutlet weak var lblEstimatedCarbonEmission: UILabel!
    @IBOutlet weak var lblEstimatedCarbonEmissionValue: UILabel!
    
    //MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = objCommonFunctions.getViewBackGroundColor()
        self.viewMainContainer.layer.cornerRadius = 10.0
        
        self.lblTotalKilometrage.text = "Total Kilometrage : " + String(objVehicle.kilometrage!) + " km"
        self.lblEstimatedCarbonEmission.text = "Estimated Carbon Emission :"
        self.lblEstimatedCarbonEmissionValue.text = String(objVehicleViewModel.calculateEstimatedCarbonEmission(kilometrage: objVehicle.kilometrage!)) + " units"
    }
}
