//
//  TableViewCell.swift
//  Chinee Dictionary
//
//  Created by Krime Loma on 7/1/20.
//  Copyright © 2020 Rakk Kiryl. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var pinyinLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var viewOfCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
         setting()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
    
    
    
    func setting () {
        viewOfCell.layer.cornerRadius = 10
    }

}
