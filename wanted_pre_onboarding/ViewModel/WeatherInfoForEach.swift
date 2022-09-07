//
//  WeatherInfoForEach.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/06.
//

import Foundation
import UIKit

struct WeatherInfoForEach {
	var temp: String
	var feelsLike: String
	var tempMin: String
	var tempMax: String
	var pressure: String
	var humidity: String
	var windSpeed: String
	var cityName: String
	var description: String
	var icon: String
	var viewModel: WeatherDetailViewModel
	
	init(weatherInfo: WeatherInfoList, setViewModel: WeatherDetailViewModel) {
		self.viewModel = setViewModel
		
		let weatherDetails = weatherInfo.main
		
		self.temp = String(weatherDetails.temp)
		self.feelsLike = String(weatherDetails.feelsLike)
		self.tempMin = String(weatherDetails.tempMin)
		self.tempMax = String(weatherDetails.tempMax)
		self.pressure = String(weatherDetails.pressure)
		self.humidity = String(weatherDetails.humidity)
		self.windSpeed = String(weatherInfo.wind.speed)
		self.cityName = String(weatherInfo.name)
		self.description = String(weatherInfo.weather[0].weatherDescription)
		self.icon = String(weatherInfo.weather[0].icon)
	}
	
	func getIconImage() -> UIImage? {
		let imageUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
		let identifier = imageUrl + cityName
		
		if let image = viewModel.weatherIconCache.object(forKey: identifier as NSString) {
			return image
		}
		return UIImage(systemName: "")
	}
}
