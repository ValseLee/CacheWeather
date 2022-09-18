//
//  Weather.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/03.
//

import UIKit
import Foundation

// MARK: - Weather
struct WeatherInfo: Codable {
	let list: [WeatherInfoList]
}

struct WeatherInfoList: Codable {
	let weather: [WeatherElement]
	let main: MainStruct
	let wind: Wind
	let dt: Int
	let name: String
}

struct MainStruct: Codable {
	let temp, feelsLike, tempMin, tempMax: Double
	let pressure: Int
	let humidity: Int
	
	enum CodingKeys: String, CodingKey {
		case temp
		case feelsLike = "feels_like"
		case tempMin = "temp_min"
		case tempMax = "temp_max"
		case pressure
		case humidity
	}
}

enum Country: String, Codable {
	case kr = "KR"
}

struct WeatherElement: Codable {
	let main: MainEnum
	let weatherDescription: String
	let icon: String
	
	enum CodingKeys: String, CodingKey {
		case main
		case weatherDescription = "description"
		case icon
	}
}

enum MainEnum: String, Codable {
	case clouds = "Clouds"
	case rain = "Rain"
	case mist = "Mist"
	case clear = "Clear"
	case snow = "Snow"
	case thunderstorm = "Thunderstorm"
	case drizzle = "Drizzle"
	case dust = "Dust"
	case sand = "Sand"
	case smoke = "Smoke"
	case fog = "Fog"
}

struct Wind: Codable {
	let speed: Double
	let deg: Int
}

