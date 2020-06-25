//
//  AbstractCollectionCell.swift
//  VintagePola
//
//  Created by Lakhwinder Singh on 31/03/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit
// MARK: Custom delegate for select/unselect cell

protocol CollectionCellDelegate {
    func updateCell()
    func updateModel(_ model: AnyObject, cell: AbstractCollectionCell)
}

/**
This define the Cellclass for **AbstractCollectionCell**.
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
class AbstractCollectionCell: UICollectionViewCell {
    
    var delegate: CollectionCellDelegate!
    
    //reuseId for thecell
    class var reuseId: String {
        return String(describing: self)
    }
    
    //Layout for the class
    class var layoutClass: AbstractFlowLayout.Type {
        return AbstractFlowLayout.self
    }
    
    //Flowlayoiut for the class
    class func flowLayout(_ margin: CGFloat) -> AbstractFlowLayout {
        let layout = self.layoutClass.init(margin)
        return layout
    }
    
    //iniot frame for the class
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }
    
    func initViews() {
    }
    
    func viewAppear() {
    }
    
    func updateBackGroundColor(_ color: UIColor) {
    }
    
    func updateWithModel(_ model: AnyObject) {
    }
    
    func updateModel(_ model: AnyObject) {
        delegate.updateModel(model, cell: self)
    }
    
    func updateCellSize(_ size: CGFloat) {
    }
    
}


