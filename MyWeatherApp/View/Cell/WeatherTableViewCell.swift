//
//  WeatherTableViewCell.swift
//  MyWeatherApp
//
//  Created by 경원이 on 2022/05/02.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    let dateLabel = UILabel()
    let weatherIcon = UIImageView()
    let weatherLabel = UILabel()
    let maxLabel = UILabel()
    let minLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configuration()
        makeConstraint()

    }

        

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }
    
    private func configuration() {
        [dateLabel, weatherIcon, weatherLabel, maxLabel, minLabel].forEach {
            self.addSubview($0)
        }
        
        [dateLabel, weatherLabel, maxLabel, minLabel].forEach {
            $0.textColor = .gray
        }
        
        dateLabel.text = "Date"
        weatherLabel.text = "Clear"
        maxLabel.text = "Max : 9°C"
        minLabel.text = "Min : 1°C"
        weatherIcon.backgroundColor = .red
        
    }
    
    private func makeConstraint() {
        
        
        weatherIcon.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalTo(weatherIcon.snp.trailing).offset(4)
            
        }

        weatherLabel.snp.makeConstraints { make in
            make.leading.equalTo(weatherIcon.snp.trailing).offset(4)
            make.bottom.equalToSuperview().offset(-4)
        }

        minLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-4)
        }

        maxLabel.snp.makeConstraints { make in
            make.trailing.equalTo(minLabel.snp.leading).offset(-8)
            make.bottom.equalToSuperview().offset(-4)
        }
        
    }

}
