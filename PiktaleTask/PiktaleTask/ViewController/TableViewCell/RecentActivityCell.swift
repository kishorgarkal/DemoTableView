//
//  RecentActivityCell.swift
//  ASIAModels
//
//  Created by MGB India  on 27/01/20.
//  Copyright © 2020 Administrator. All rights reserved.
//

import UIKit

class RecentActivityCell: UITableViewCell {
    
    //Mark: IBOutlets
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var play_img: UIImageView!
    @IBOutlet weak var imageHight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
        
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = UIColor.clear.cgColor
        userImage.clipsToBounds = true
    }
    
    internal var aspectConstraint : NSLayoutConstraint? {
         didSet {
             if oldValue != nil {
                 thumbImage.removeConstraint(oldValue!)
             }
             if aspectConstraint != nil {
                 thumbImage.addConstraint(aspectConstraint!)
             }
         }
     }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
    }

    var message: URL? {
           didSet {
               guard let message = message else { return }
               
               
//               self.thumbImage.reloadInputViews()
//               thumbImage.contentMode = .scaleToFill
//               thumbImage.kf.indicatorType = .activity
//               
//            thumbImage.kf.setImage(with: message, placeholder: UIImage(named: "img_default_i.png"),  completionHandler: { [weak self]  (image, error, cacheType, imageUrl) in
//                       guard let strongSelf = self, let image = image else { return }
//                       
//                       let aspect = image.size.width / image.size.height
//                   
//                  //     print("setting aspect \(aspect)")
//               
//                strongSelf.aspectConstraint = NSLayoutConstraint(item: strongSelf.thumbImage!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: strongSelf.thumbImage!, attribute: NSLayoutConstraint.Attribute.height, multiplier: aspect, constant: 0.0)
//
//                       strongSelf.setNeedsLayout()
//                       
//                       strongSelf.layoutIfNeeded()
//                
//                self?.thumbImage.reloadInputViews()
//               
//                   })
           }
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
