//
//  VehicleListTVCell.swift
//  Vehicles
//
//  Created by Ajay Gabani on 17/11/22.
//

import UIKit

class VehicleListTVCell: UITableViewCell {

    @IBOutlet weak var lblCarMakeAndModel: UILabel!
    @IBOutlet weak var lblCarVin: UILabel!
    
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
        return UINib(nibName:"VehicleListTVCell", bundle: nil)
    }
    
    class var idetifier: String {
        return "VehicleListTVCell"
    }

}
