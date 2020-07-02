//
//  UIButton+Ext.swift
//  GoodWeather
//
//  Created by Han Luong on 10/10/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import UIKit

@IBDesignable
class UIButton_Ext: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }

    func updateView() {
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }
}
