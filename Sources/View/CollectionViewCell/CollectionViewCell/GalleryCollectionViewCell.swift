//
//  MyCollectionCell.swift

import UIKit

/**
This define the Cellclass for **GalleryCollectionViewCell**.
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
class GalleryCollectionViewCell: AbstractCollectionCell {
    
    //MARK: This define the flowlaout of the collectionView
    override class var layoutClass: AbstractFlowLayout.Type {
        return GalleryFlowLayout.self
    }
    
    //MARK:- Initialize method
    override func initViews() {
        addSubviews([galleryImage])
    }
    
    //This function called when cell is reused
    override func updateWithModel(_ model: AnyObject) {
        galleryImage.image = nil
        galleryImage.imageURLString = (model as! GalleryData).previewURL
    }

    //MARK: This is used to sedup the image view in cell
    let galleryImage: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    
    //MARK:- Layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        let subviews = ["image": galleryImage]
        addVisualConstraints(["H:|-5-[image]-5-|", "V:|-5-[image]-5-|"], subviews: subviews)
    }
}


