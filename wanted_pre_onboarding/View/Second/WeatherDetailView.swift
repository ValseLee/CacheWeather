//
//  SecondView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class WeatherDetailView: UIView {
	private let weatherIcon: WeatherIconView = {
		let iv = WeatherIconView(weatherIcon: UIImage(systemName: "heart"), size: 75)
		return iv
	}()
	
	private let curruntTemp: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let bodyFeelTemp: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let minTemp: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let maxTemp: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let atmosPress: UILabel = {
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
