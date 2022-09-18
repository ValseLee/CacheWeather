//
//  WeatherDetailViewModel.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/04.
//

import UIKit

final class WeatherDetailViewModel {
	private let networkManager = WeatherNetwork.shared
	private let imageCacheManager = ImageProvider.shared
	
	public weak var mainViewControllerDelegate: MainViewController? = nil
	
	lazy var weatherInfoList = [WeatherInfoList]()
	lazy var weatherIconList = [UIImage]()
	lazy var weatherIconCache = NSCache<NSString, UIImage>()
	lazy var weatherIconImage = UIImage()
	
	public init() {
		fetchData()
		networkManager.viewModelDelegate = self
		weatherIconCache = imageCacheManager.getWeatherIconCache()
	}
	
	public func fetchData() {
		self.networkManager.fetchWeatherData { [weak self] (result) in
			switch result {
				case .success(let result):
					self?.weatherInfoList = result as! [WeatherInfoList]
					self?.mainViewControllerDelegate?.updateUI()
				case .failure(let error):
					dump(error)
			}
		}
	}
	
	public func loadImage(url: String, cityName: String) -> UIImage? {
		self.imageCacheManager.loadImage(imageURL: url, cityName: cityName) { [weak self] image in
			guard let image = image else { return }
			self?.weatherIconImage = image
		}
		return weatherIconImage
	}
	
	// MARK: load Cached Image
	public func loadCachedImage(url: String, cityName: String) -> UIImage? {
		let identifier = url + cityName
		return weatherIconCache.object(forKey: identifier as NSString)
	}
}
