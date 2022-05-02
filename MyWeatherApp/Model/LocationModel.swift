//
//  LocationModel.swift
//  MyWeatherApp
//
//  Created by 경원이 on 2022/05/02.
//
import Foundation

// MARK: - LocationElement
struct LocationElement: Codable {
    let title, locationType: String
    let woeid: Int
    let lattLong: String

    enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case lattLong = "latt_long"
    }
}

typealias Location = [LocationElement]

