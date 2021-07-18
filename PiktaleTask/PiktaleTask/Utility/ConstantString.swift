//
//  ConstantString.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import Foundation



//MARK:  URL


public func getAspectRatioAccordingToiPhones(cellImageFrame:CGSize,downloadedImage: UIImage)->CGFloat {
    let widthOffset = downloadedImage.size.width - cellImageFrame.width
    let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
    let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
    let effectiveHeight = downloadedImage.size.height - heightOffset
    return(effectiveHeight)
}
