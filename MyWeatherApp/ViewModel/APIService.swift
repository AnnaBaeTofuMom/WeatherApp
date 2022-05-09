//
//  APIService.swift
//  MyWeatherApp
//
//  Created by 경원이 on 2022/05/02.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    
    enum requestURL: String {
        case locationSearch = "https://www.metaweather.com/api/location/search/?query="
        case weatherSearch = "https://www.metaweather.com/api/location/"
    }

    enum cityName: String {
        case seoul = "seoul"
        case london = "london"
        case chicago = "chicago"
    }
    var cityArray: [String] = ["seoul", "london", "chicago"]

    func requestLocationId(cityName: String, completion: @escaping ([LocationElement]?) -> Void) {
        let decoder = JSONDecoder()
        AF.request(requestURL.locationSearch.rawValue + cityName, method: .get).validate().responseDecodable(of: [LocationElement].self, decoder: decoder) {
            res in
            switch res.result {
            case .success(let locaInfo):
                
                completion(locaInfo)
                
            case .failure(let error):
                completion(nil)
            }
            
        }
            
    }
    
    func requestWeather(woeid: String, completion: @escaping ([ConsolidatedWeather]?) -> Void) {
        let decoder = JSONDecoder()
        AF.request(requestURL.weatherSearch.rawValue + woeid, method: .get).validate().responseDecodable(of: WeatherElement.self, decoder: decoder) {
            res in
            switch res.result {
            case.success(let weatInfo):
                print(weatInfo.consolidatedWeather)
                
                completion(weatInfo.consolidatedWeather)
            case.failure(let error):
                print(error)
                completion(nil)
            }
        }
        
    }



    
    
    
}

