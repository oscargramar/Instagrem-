//
//  InstagremTableViewCell.swift
//  Instagrem
//
//  Created by Oscar G.M on 3/7/16.
//  Copyright © 2016 GMStudios. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstagremTableViewCell: UITableViewCell {
  
    @IBOutlet var postImageView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    var instagremPost:PFObject!{
        didSet{
            self.postImageView.file = instagremPost["media"] as? PFFile
            self.postImageView.loadInBackground()
            self.captionLabel.text = instagremPost["caption"] as? String
            self.captionLabel.sizeToFit()

        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
