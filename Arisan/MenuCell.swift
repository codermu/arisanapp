//
//  MenuCell.swift
//  Arisan
//
//  Created by ibrahim on 11/3/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let menu: UIButton = {
        let lbl = UIButton()
        lbl.backgroundColor = UIColor.clear
        return lbl
    }()
    
    override var isHighlighted: Bool {
        didSet {
            let textColor = isHighlighted ? UIColor.white : UIColor.init(red: 91, green: 14, blue: 13, alpha: 100)
            menu.setTitleColor(textColor, for: .normal)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            let textColor = isHighlighted ? UIColor.white : UIColor.init(red: 91, green: 14, blue: 13, alpha: 100)
            menu.setTitleColor(textColor, for: .normal)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(menu)
        addConstraintsWithFormat(format:"H:[v0(110)]", views: menu)
        addConstraintsWithFormat(format:"V:[v0(28)]", views: menu)
        
        addConstraint(NSLayoutConstraint(item: menu, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: menu, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
