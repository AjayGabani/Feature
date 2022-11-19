//
//  HeaderVehicleListTVCell.swift
//  Vehicles
//
//  Created by Ajay Gabani on 17/11/22.
//

import UIKit

class HeaderVehicleListTVCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Nib methods
    class var nib: UINib {
        return UINib(nibName:"HeaderVehicleListTVCell", bundle: nil)
    }
    
    class var idetifier: String {
        return "HeaderVehicleListTVCell"
    }
    
}
