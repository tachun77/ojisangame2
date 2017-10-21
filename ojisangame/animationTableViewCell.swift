//
//  animationTableViewCell.swift
//  ojisangame
//
//  Created by 福島達也 on 2017/10/20.
//  Copyright © 2017年 Tatsuya Fukushima. All rights reserved.
//

import UIKit

class animationTableViewCell: UITableViewCell {
    
    @IBOutlet var namelabel: UILabel!
    
    @IBOutlet var demobutton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
