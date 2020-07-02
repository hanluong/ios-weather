//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Han Luong on 10/5/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import UIKit

protocol AddWeatherCityDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    var delegate: AddWeatherCityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtnWasPressed(_ sender: Any) {
        if let city = cityTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=27274c04f596619f7ce965e749c9581b")!
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            WebService().load(resource: weatherResource) { [weak self] (result) in
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
