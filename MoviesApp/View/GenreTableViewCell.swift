//
//  GenreTableViewCell.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import Foundation
import UIKit
class GenreTableViewCell: UITableViewCell {
    @IBOutlet weak var genreCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
