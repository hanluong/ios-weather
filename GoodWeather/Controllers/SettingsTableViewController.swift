//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Han Luong on 10/10/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func settingsDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {

    private var settingsVM = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.settingsDone(vm: self.settingsVM)
        }
        self.dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_SETTING_CELL, for: indexPath)
        let settingItem = settingsVM.units[indexPath.row]
        cell.textLabel?.text = settingItem.displayName
        if settingItem == self.settingsVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { (cell) in
            cell.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.settingsVM.selectedUnit = Unit.allCases[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}
