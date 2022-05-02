//
//  MainViewModel.swift
//  MyWeatherApp
//
//  Created by 경원이 on 2022/05/03.
//

import Foundation

class MainViewModel {
    let api = APIService()
    enum woeid: String {
        case london = "44418"
        case seoul = "1132599"
        case chicago = "2379574"
    }
    var cityArray: [String] = ["seoul", "london", "chicago"]
    
    var seoulWeatherModel: [ConsolidatedWeather]?
    
    var londonWeatherModel: [ConsolidatedWeather]?
    
    var chicagoWeatherModel: [ConsolidatedWeather]?
    
    func getLocationId() {
        api.requestLocationId(cityName: "seoul") { element in
            print(element)
        }
    }
    
    func getWeather() {
        
        api.requestWeather(woeid: woeid.seoul.rawValue) { element in
            guard let res = element else { return }
            self.seoulWeatherModel = res
        }
        api.requestWeather(woeid: woeid.london.rawValue) { element in
            guard let res = element else { return }
            self.londonWeatherModel = res
        }
        api.requestWeather(woeid: woeid.chicago.rawValue) { element in
            guard let res = element else { return }
            self.chicagoWeatherModel = res
        }
        
    }
    
}


