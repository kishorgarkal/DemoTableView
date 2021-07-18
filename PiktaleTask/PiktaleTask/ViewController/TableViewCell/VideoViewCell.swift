//
//  VideoViewCell.swift
//  PiktaleTask
//
//  Created by MYGENOMEBOX INDIA on 18/07/21.
//

import UIKit

class VideoViewCell: UITableViewCell {
    //Mark: IBOutlets
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var ContainerView: UIView!
   
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        videoView.layer.cornerRadius = 6
        videoView.layer.masksToBounds = true
        ContainerView.layer.cornerRadius = 6
        ContainerView.layer.masksToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
