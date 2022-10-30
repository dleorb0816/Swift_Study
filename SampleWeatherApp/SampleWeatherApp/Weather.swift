//
//  Weather.swift
//  SampleWeatherApp
//
//  Created by 이대규 on 2022/10/17.
//

// Weather.swift
import Foundation

struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
