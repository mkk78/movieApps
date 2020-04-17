//
//  ReviewTableViewCell.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import Foundation
import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var reviewContentTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewContentTextView.isEditable = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
