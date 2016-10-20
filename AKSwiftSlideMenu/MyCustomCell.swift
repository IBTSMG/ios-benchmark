//
//  MyCustomCell.swift
//  iosBenchmark
//
//  Created by SMG on 20/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var lblAccount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
