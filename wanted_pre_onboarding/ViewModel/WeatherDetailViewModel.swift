//
//  WeatherDetailViewModel.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/04.
//

import Foundation

final class WeatherDetailViewModel {
	private let networkManager = WeatherNetwork.shared
	weak var firstViewControllerdelegate: FirstViewController? = nil
	lazy var weatherInfoList = [WeatherInfoList]()
	
	init() {
		fetchData()
	}
	
	func fetchData() {
		networkManager.fetchWeatherData { (result) in
			switch result {
				case .success(let result):
					self.weatherInfoList = result as! [WeatherInfoList]
					self.firstViewControllerdelegate?.updateUI()
				case .failure(let error):
					dump(error)
			}
		}
	}
}
