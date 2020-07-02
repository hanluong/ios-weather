//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Han Luong on 10/10/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefault = UserDefaults.standard
            if let value = userDefault.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }
        
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
