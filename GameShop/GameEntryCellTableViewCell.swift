//
//  GameEntryCellTableViewCell.swift
//  GameShop
//
//  Created by Alican Toprak on 31.05.16.
//  Copyright © 2016 Alican Toprak. All rights reserved.
//

import UIKit

class GameEntryCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var consoleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        /*
        if(selected){
            if (self.accessoryType == UITableViewCellAccessoryType.None){
             self.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            self.accessoryType = UITableViewCellAccessoryType.None
            }
        
        }
         */
        
        
        // Configure the view for the selected state
    }

}
