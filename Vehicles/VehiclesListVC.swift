//
//  VehiclesListVC.swift
//  Vehicles
//
//  Created by Ajay Gabani on 17/11/22.
//

import UIKit

class VehiclesListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var viewMainContainer: UIView!
    @IBOutlet weak var viewTableComponets: UIView!
    @IBOutlet weak var txtNumberOfVehicles: UITextField!
    @IBOutlet weak var btnGetList: UIButton!
    @IBOutlet weak var tblVehiclesList: UITableView!
    @IBOutlet weak var lblErrorMessageDisplay: UILabel!
    @IBOutlet weak var segmentSortCars: UISegmentedControl!
    
    var arrVehiclesList: [Vehicle]?
    private var objVehicleViewModel = VehicleViewModel()
    private var objCommonFunctions = CommonFunctions()
    
    //MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        objCommonFunctions.setNavigationControllerApperance(title: "Vehicle List", forViewController: self)
        self.tblVehiclesList.delegate = self
        self.tblVehiclesList.dataSource = self
        self.tblVehiclesList.sectionHeaderTopPadding = 0
        self.tblVehiclesList.register(VehicleListTVCell.nib, forCellReuseIdentifier: VehicleListTVCell.idetifier)
        self.tblVehiclesList.register(HeaderVehicleListTVCell.nib, forCellReuseIdentifier: HeaderVehicleListTVCell.idetifier)
        
        self.viewTableComponets.isHidden = true
        self.lblErrorMessageDisplay.isHidden = false
    }
    
    private func setupBinderForVehicleListAPI() {
        objVehicleViewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
                self?.arrVehiclesList = nil
                self?.tblVehiclesList.reloadData()
                self?.lblErrorMessageDisplay.text = error
                self?.viewTableComponets.isHidden = true
                self?.lblErrorMessageDisplay.isHidden = false
            } else {
                self?.arrVehiclesList = self?.objVehicleViewModel.arrVehiclesList
                self?.sortCarListBasedOn()
                self?.tblVehiclesList.reloadData()
                self?.viewTableComponets.isHidden = false
                self?.lblErrorMessageDisplay.isHidden = true
            }
        }
    }
    
    private func sortCarListBasedOn() {
        if segmentSortCars.selectedSegmentIndex == 0 {
            arrVehiclesList = arrVehiclesList?.sorted(by: {$0.vin! < $1.vin!})
        } else {
            arrVehiclesList = arrVehiclesList?.sorted(by: {$0.carType! < $1.carType!})
        }
        
        self.tblVehiclesList.reloadData()
    }

    //MARK: Button Clicks
    @IBAction func btnGetListTapped(_ sender: Any) {
        self.view.endEditing(true)
        if let sizeOfData = Int32(txtNumberOfVehicles.text!) {
            objVehicleViewModel.getVehiclesList(size: sizeOfData)
            setupBinderForVehicleListAPI()
        } else {
            objCommonFunctions.showAlertMessageWithNoAction(message: "Please insert valid number.", forViewController: self)
        }
    }
    
    //MARK: Segment change event
    @IBAction func segmentSortCarChangedEvent(_ sender: Any) {
        self.sortCarListBasedOn()
    }
    
        
    //MARK: Tableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrVehiclesList?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderVehicleListTVCell.idetifier) as! HeaderVehicleListTVCell
            return headerCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VehicleListTVCell.idetifier, for: indexPath) as! VehicleListTVCell
        
        cell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        cell.contentView.layer.borderWidth = 1.0
        let objVehicle = self.arrVehiclesList?[indexPath.row]
        cell.lblCarVin.text = objVehicle?.vin
        cell.lblCarMakeAndModel.text = objVehicle?.makeAndModel
        if indexPath.row%2 == 1 {
            cell.contentView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.3)
        } else {
            cell.contentView.backgroundColor = UIColor.white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objVehicleDetails = storyboard?.instantiateViewController(withIdentifier: "VehicleDetailsVC") as! VehicleDetailsVC
        objVehicleDetails.objVehicle = self.arrVehiclesList?[indexPath.row]
        self.navigationController?.pushViewController(objVehicleDetails, animated: true)
    }
}

