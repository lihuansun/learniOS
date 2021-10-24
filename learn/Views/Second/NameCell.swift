//
//  NameCell.swift
//  learn
//
//  Created by sunliheng on 2021/10/23.
//

import UIKit

class NameCell: UITableViewCell {
    @IBOutlet weak var vName: UILabel!
    @IBOutlet weak var vButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
