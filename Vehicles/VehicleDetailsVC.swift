//
//  VehicleDetailsVC.swift
//  Vehicles
//
//  Created by Ajay Gabani on 18/11/22.
//

import UIKit

class VehicleDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var objCommonFunctions = CommonFunctions()
    var objVehicle: Vehicle!
    @IBOutlet weak var tblVehicleDetails: UITableView!
    var arrPropertyList = ["Vin", "Make & Model", "Color", "Car Type"]
    
    //MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        objCommonFunctions.setNavigationControllerApperance(title: objVehicle.makeAndModel!, forViewController: self)
        self.tblVehicleDetails.register(VehicleDetailsTVCell.nib, forCellReuseIdentifier: VehicleDetailsTVCell.idetifier)
    }

    //MARK: Tableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPropertyList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VehicleDetailsTVCell.idetifier, for: indexPath) as! VehicleDetailsTVCell
        
        cell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        cell.contentView.layer.borderWidth = 1.0
        let strPropertyTitle = self.arrPropertyList[indexPath.row]
        cell.lblPropertyTitle.text = strPropertyTitle
        if strPropertyTitle == "Vin" {
            cell.lblPropertyValue.text = objVehicle.vin
        } else if strPropertyTitle == "Make & Model" {
            cell.lblPropertyValue.text = objVehicle.makeAndModel
        } else if strPropertyTitle == "Color" {
            cell.lblPropertyValue.text = objVehicle.color
        } else if strPropertyTitle == "Car Type" {
            cell.lblPropertyValue.text = objVehicle.carType
        }
        if indexPath.row%2 == 1 {
            cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        } else {
            cell.contentView.backgroundColor = UIColor.white
        }
        return cell
    }
}
