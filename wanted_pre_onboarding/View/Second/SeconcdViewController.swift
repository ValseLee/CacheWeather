//
//  SeconcdViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class SeconcdViewController: UIViewController {
	private let weatherDetailView = WeatherDetailView()
	private var weatherInfoForEach: WeatherInfoForEach?
	
	private var viewModel: WeatherDetailViewModel?
	private var cityName: String?
	
	// MARK: LifeCycle
	init(cityName: String, viewModel: WeatherDetailViewModel, weatherInfo: WeatherInfoForEach) {
		super.init(nibName: nil, bundle: nil)
		self.cityName = cityName
		self.viewModel = viewModel
		self.weatherInfoForEach = weatherInfo
		self.loadImageFromCache()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let cityName = cityName else { return }
		configNavBarUI(withTitle: "\(cityName)", prefersLargerTitle: true, isHidden: false)
		view.backgroundColor = .white
		configUI()
    }
	
	// MARK: Func
	private func configUI() {
		view.addSubview(weatherDetailView)
		weatherDetailView.setAnchor(anchorTo: [.top(padding: 15, isToSafeArea: true)], inView: view)
		weatherDetailView.setCenterX(inView: view)
	}
	
	private func loadImageFromCache() {
		let icon = weatherInfoForEach!.icon
		let imageUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
		updateDetailView()
		
		if let cachedImage = weatherInfoForEach?.getIconImage() {
			weatherDetailView.updateImage(weatherIcon: cachedImage)
		} else {
			weatherDetailView.updateImage(weatherIcon: (viewModel?.loadImage(url: imageUrl, cityName: cityName!))!)
		}
		
	}

	private func updateDetailView() {
		weatherDetailView.updateUI(weatherInfoForEach: weatherInfoForEach!)
	}
}
