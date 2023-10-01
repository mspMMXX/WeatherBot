//
//  WeatherData.swift
//  WeatherBot
//
//  Created by Markus Platter on 01.10.23.
//

import Foundation

struct WeatherData: Decodable {
    let location: Location
    let current: Current
}

struct Location: Decodable {
    let name: String
}

struct Current: Decodable {
    let temp_c: Double
    let condition: Condition
    
}

struct Condition: Decodable {
    let text: String
}
