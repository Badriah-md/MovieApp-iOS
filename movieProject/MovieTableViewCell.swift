//
//  MovieTableViewCell.swift
//  movieProject
//
//  Created by Bdoor on 29/07/1442 AH.
//

import UIKit


class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView:UIImageView!
    @IBOutlet weak var movieNameLbl: UILabel!
    
    @IBOutlet weak var movieTypeLbl: UILabel!
    @IBOutlet weak var movieRateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
