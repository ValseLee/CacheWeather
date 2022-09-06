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
	lazy var weatherIconCacheImage = UIImage()
	
	public init() {
		fetchData()
		networkManager.viewModelDelegate = self
		weatherIconCache = imageCache.getWeatherIconCache()
	}
	
	public func fetchData() {
		self.networkManager.fetchWeatherData { [weak self] (result) in
			switch result {
				case .success(let result):
					self?.weatherInfoList = result as! [WeatherInfoList]
					self?.firstViewControllerDelegate?.updateUI()
				case .failure(let error):
					dump(error)
			}
		}
	}
	
	// MARK: load Cached Image
	public func loadCacheImage(url: String, cityName: String) -> UIImage? {
		imageCache.loadImage(imageURL: url, cityName: cityName) { image in
			guard let image = image else { return }
			self.weatherIconCacheImage = image
		}
		return weatherIconCacheImage
	}
}
