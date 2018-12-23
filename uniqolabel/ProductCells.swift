//
//  ProductCells.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 23/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import UIKit

class ProductCells: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
