//
//  SecondView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class WeatherDetailView: UIView {
	private let weatherIcon: WeatherIconView = {
		let iv = WeatherIconView(size: 75)
		return iv
	}()
	
	private let temp: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let feelsLike: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let tempMin: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let tempMax: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let pressure: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let windSpeed: UILabel = {
		let la = UILabel()
		return la
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configUI() {
		configWeatherIconView()
	}
	
	func configWeatherIconView() {
		addSubview(weatherIcon)
		weatherIcon.setCenterX(inView: self)
		weatherIcon.setAnchor(anchorTo: [.top(padding: 30, isToSafeArea: true)], inView: self)
	}
}
