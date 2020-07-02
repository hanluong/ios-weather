//
//  Double+Ext.swift
//  GoodWeather
//
//  Created by Han Luong on 10/9/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        return "\(Int(self))º"
    }
}
