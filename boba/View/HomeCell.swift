//
//  HomeCell.swift
//  
//
//  Created by Stephanie Santana on 3/3/19.
//

import UIKit

class HomeCell: UITableViewCell {

    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameOfPlace: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var ratings: UIImageView!
    @IBOutlet weak var distanceFrom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}