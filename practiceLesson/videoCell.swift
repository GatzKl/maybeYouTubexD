//
//  videoCell.swift
//  practiceLesson
//
//  Created by Александр Калашников on 30/6/22.
//

import UIKit

class videoCell: UITableViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewersCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
        previewImageView.contentMode = .scaleToFill
        
    }

}


