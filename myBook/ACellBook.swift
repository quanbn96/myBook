//
//  ACellBook.swift
//  myBook
//
//  Created by Quan on 7/20/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

let kCellWidth : CGFloat = 66
let kCellHeight : CGFloat = 20

class ACellBook : UICollectionViewCell {
    var nameLabel : UILabel!
    var imgView  : UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(kCellWidth, kCellWidth + kCellHeight)
    }
    
    func addSubViews() {
        if imgView == nil {
            imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: kCellWidth, height: kCellWidth))
            imgView.layer.borderColor = tintColor.CGColor
            contentView.addSubview(imgView)
        }
        if nameLabel == nil {
            nameLabel = UILabel(frame: CGRect(x: 0, y: kCellWidth, width: kCellWidth, height: kCellHeight))
            nameLabel.textAlignment = .Center
            nameLabel.textColor = UIColor(white: 0.9, alpha: 1.0)
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFontOfSize(12)
            contentView.addSubview(nameLabel)
        }
    }
    
    override var selected: Bool {
        didSet {
            imgView.layer.borderWidth = selected ? 2 : 0
            
        }
    }
    
}
