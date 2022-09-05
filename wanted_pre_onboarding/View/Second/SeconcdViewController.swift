//
//  SeconcdViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class SeconcdViewController: UIViewController {
	private let weatherDetailView = WeatherDetailView()
	private var viewModel: WeatherDetailViewModel?
	private var weatherInfoArray: WeatherInfoList?
	
	private var cityName: String?
	
	init(cityName: String, viewModel: WeatherDetailViewModel, weatherInfoArray: WeatherInfoList) {
		super.init(nibName: nil, bundle: nil)
		self.cityName = cityName
		self.viewModel = viewModel
		self.weatherInfoArray = weatherInfoArray
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
	
	private func configUI() {
		view.addSubview(weatherDetailView)
		weatherDetailView.setAnchor(anchorTo: [.top(padding: 15, isToSafeArea: true)], inView: view)
		weatherDetailView.setCenterX(inView: view)
	}
	
	private func loadImageFromCache() {
		let icon = weatherInfoArray!.weather[0].icon
		let imageUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
		// image load는 뷰모델에서하기. 캐싱하기
	}
}
