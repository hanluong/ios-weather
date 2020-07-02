//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Han Luong on 10/5/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    private var weatherListViewModel = WeatherListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_GOTO_ADD_WEATHER_CITY {
            self.prepareSegueForAddWeatherCity(segue: segue)
        } else if segue.identifier == SEGUE_GOTO_SETTINGS {
            self.prepareSegueForSettings(segue: segue)
        }
    }
    
    private func prepareSegueForAddWeatherCity(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else { fatalError() }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else { fatalError() }
        addWeatherCityVC.delegate = self
    }
    
    private func prepareSegueForSettings(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else { fatalError() }
        guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else { fatalError() }
        settingsVC.delegate = self
    }

    
}

// MARK: - Implementing table view datasource, delegate
extension WeatherListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_WEATHER_LIST_CELL, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(self.weatherListViewModel.modelAt(indexPath.row))
        return cell
    }
}

//MARK: - Implementing AddWeatherCityDelegate
extension WeatherListTableViewController: AddWeatherCityDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    
}

// MARK: - Implementing Settings delegate
extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
}
