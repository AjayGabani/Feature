//
//  VehicleDetailsTVCell.swift
//  Vehicles
//
//  Created by Ajay Gabani on 18/11/22.
//

import UIKit

class VehicleDetailsTVCell: UITableViewCell {

    @IBOutlet weak var lblPropertyTitle: UILabel!
    @IBOutlet weak var lblPropertyValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class var nib: UINib {
        return UINib(nibName:"VehicleDetailsTVCell", bundle: nil)
    }
    
    class var idetifier: String {
        return "VehicleDetailsTVCell"
    }
}
