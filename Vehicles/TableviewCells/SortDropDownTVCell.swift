//
//  SortDropDownTVCell.swift
//  Vehicles
//
//  Created by Ajay Gabani on 17/11/22.
//

import UIKit

class SortDropDownTVCell: UITableViewCell {

    @IBOutlet weak var lblSortOption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class var nib: UINib {
        return UINib(nibName:"SortDropDownTVCell", bundle: nil)
    }
    
    class var idetifier: String {
        return "SortDropDownTVCell"
    }
}
