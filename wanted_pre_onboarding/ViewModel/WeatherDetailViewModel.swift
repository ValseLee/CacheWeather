//
//  WeatherDetailViewModel.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/04.
//

import UIKit

final class WeatherDetailViewModel {
	private let networkManager = WeatherNetwork.shared
	private let imageCache = ImageProvider.shared
	
	weak var firstViewControllerDelegate: FirstViewController? = nil
	weak var secondViewControllerDelegate: SeconcdViewController? = nil
	
	lazy var weatherInfoList = [WeatherInfoList]()
	lazy var weatherIconList = [UIImage]()
	lazy var weatherIconCache = NSCache<NSString, UIImage>()
	
	public init() {
		fetchData()
		networkManager.viewModelDelegate = self
		weatherIconCache = imageCache.getWeatherIconCache()
		dump(weatherIconCache)
	}
	
	public func fetchData() {
		networkManager.fetchWeatherData { [weak self] (result) in
			switch result {
				case .success(let result):
					self?.weatherInfoList = result as! [WeatherInfoList]
					self?.firstViewControllerDelegate?.updateUI()
				case .failure(let error):
					dump(error)
			}
		}
	}
	
//	public func loadImage(imageURL: String, cityName: String, completion: @escaping (UIImage?) -> Void) {
//		imageCache.loadImage(imageURL: imageURL, cityName: cityName) { (image) in
//			// code
//		}
//	}
}
