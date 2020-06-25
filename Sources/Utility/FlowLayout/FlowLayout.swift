//
//  AbstractFlowLayout.swift
//  VintagePola
//
//  Created by Lakhwinder Singh on 03/04/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit

class AbstractFlowLayout: UICollectionViewFlowLayout {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(_ margin: CGFloat) {
        super.init()
        parentMargin = margin
        initView()
    }
    
    var parentMargin: CGFloat = 0.0
    
    func initView() {
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        minimumLineSpacing = minLineSpace
        minimumInteritemSpacing = 0
        itemSize = cellSize
    }
    
    var minLineSpace: CGFloat {
        return 5;
    }
    
    var aspectRatio: CGFloat {
        return 0.4;
    }
    
    var width: CGFloat {
        return UIScreen.mainSize.width - (parentMargin * 2.0)
    }
    
    var height: CGFloat {
        return width * self.aspectRatio
    }
    
    var rows: CGFloat {
        return 1.0
    }
    
    var cellSize: CGSize {
        return CGSize(width: (width - ((rows-1) * self.minimumLineSpacing))/rows , height: self.height)
    }
}

//////////////////////////////////////////////////////////////////////////////////////

class GalleryFlowLayout: AbstractFlowLayout {
    
    let marginCells: CGFloat = 5
    
    override var cellSize: CGSize {
        let ratio: CGFloat = 1.0
        let columns: CGFloat = 2
        let collWidth = UIScreen.mainSize.width - (marginCells * (columns + 1))
        let width = collWidth / columns
        return CGSize(width: width, height: width*ratio)
    }

}



class GalleryFullImageFlowLayout: AbstractFlowLayout {
    
    let marginCells: CGFloat = 0
    
    override var cellSize: CGSize {
        let ratio: CGFloat = 1.5
        let columns: CGFloat = 1
        let collWidth = UIScreen.mainSize.width - (marginCells * (columns + 1))
        let width = collWidth / columns
        return CGSize(width: width, height: width*ratio)
    }
    
    override var minLineSpace: CGFloat {
        return 0
    }
    
    override func initView() {
        super.initView()
        scrollDirection = .horizontal
    }

}


