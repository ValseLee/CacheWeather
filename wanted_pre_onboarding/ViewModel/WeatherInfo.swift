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
	let cnt: Int
	let list: [WeatherInfoList]
}

struct WeatherInfoList: Codable {
	let coord: Coord
	let weather: [WeatherElement]
	let main: MainClass
	let wind: Wind
	let dt: Int
	let name: String
//	let clouds: Clouds
}

//struct Clouds: Codable {
//	let all: Int
//}

struct Coord: Codable {
	let lon, lat: Double
}

struct MainClass: Codable {
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
}

struct Wind: Codable {
	let speed: Double
	let deg: Int
}

