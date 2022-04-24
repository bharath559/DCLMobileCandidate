//
//  ComicsTableViewCell.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import UIKit

class ComicsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var tiltle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(thumbNail: URL?, title: String) {
        self.tiltle.text = title
        
        if let url = thumbNail {
            self.thumbNail.loadImage(url: url) { status in
                if status {
                    self.layoutSubviews()
                }
            }
        }
    }

}
