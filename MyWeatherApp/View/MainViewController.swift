//
//  MainViewController.swift
//  MyWeatherApp
//
//  Created by 경원이 on 2022/05/02.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    let model = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configuration()
        
        self.makeConstraints()
        
        getWeather()

        
    }
    
    private func getWeather() {
        self.model.getWeather() { str in
            print(str)
            self.tableView.reloadData()
        }
        
    }
    
    private func configuration() {
        
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Seoul"
        }
        
        if section == 1 {
            return "London"
        }
        
        if section == 2 {
            return "Chicago"
        }
        
        return "None"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell()}
        
        if indexPath.section == 0 {
            let md = self.model.seoulWeatherModel
            cell.dateLabel.text = md?[indexPath.row].applicableDate
            cell.minLabel.text = "Min : \(Int(trunc(md?[indexPath.row].minTemp ?? 0)))°C"
            cell.maxLabel.text = "Max : \(Int(trunc(md?[indexPath.row].maxTemp ?? 0)))°C"
            cell.weatherLabel.text = md?[indexPath.row].weatherStateName
            
        }
        
        if indexPath.section == 1 {
            let md = self.model.londonWeatherModel
            cell.dateLabel.text = md?[indexPath.row].applicableDate
            cell.minLabel.text = "Min : \(Int(trunc(md?[indexPath.row].minTemp ?? 0)))°C"
            cell.maxLabel.text = "Max : \(Int(trunc(md?[indexPath.row].maxTemp ?? 0)))°C"
            cell.weatherLabel.text = md?[indexPath.row].weatherStateName
        }
        
        if indexPath.section == 2 {
            let md = self.model.chicagoWeatherModel
            cell.dateLabel.text = md?[indexPath.row].applicableDate
            cell.minLabel.text = "Min : \(Int(trunc(md?[indexPath.row].minTemp ?? 0)))°C"
            cell.maxLabel.text = "Max : \(Int(trunc(md?[indexPath.row].maxTemp ?? 0)))°C"
            cell.weatherLabel.text = md?[indexPath.row].weatherStateName
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
   
    
    
    
    
    
    
}
