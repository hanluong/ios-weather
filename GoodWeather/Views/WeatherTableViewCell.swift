//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by Han Luong on 10/5/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ vm: WeatherViewModel) {
        self.textLabel?.text = vm.name
        self.detailTextLabel?.text = vm.currentTemperature.temperature.formatAsDegree
    }

}
