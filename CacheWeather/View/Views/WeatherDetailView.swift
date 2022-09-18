//
//  SecondView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class WeatherDetailView: UIView {
	private let weatherIconView: UIImageView = {
		return WeatherIconView(size: 75)
	}()
	
	private let cityName: UILabel = {
		return CustomWeatherInfoLabel(category: .cityNameLarge)
	}()
	
	private let temp: UILabel = {
		return CustomWeatherInfoLabel(category: .temp)
	}()
	
	private let feelsLike: UILabel = {
		return CustomWeatherInfoLabel(category: .feelsLike)
	}()
	
	private let tempMin: UILabel = {
		return CustomWeatherInfoLabel(category: .tempMin)
	}()
	
	private let tempMax: UILabel = {
		return CustomWeatherInfoLabel(category: .tempMax)
	}()
	
	private let pressure: UILabel = {
		return CustomWeatherInfoLabel(category: .pressure)
	}()
	
	private let windSpeed: UILabel = {
		return CustomWeatherInfoLabel(category: .windSpeed)
	}()
	
	private let humidLabel: UILabel = {
		return CustomWeatherInfoLabel(category: .humidity)
	}()
	
	private let descriptionLabel: UILabel = {
		return CustomWeatherInfoLabel(category: .description)
	}()
	
	// MARK: LifeCycle
	override init(frame: CGRect) {
		super.init(frame: frame)
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configUI() {
		configWeatherIconView()
		configStackView()
	}
	
	private func configWeatherIconView() {
		addSubview(weatherIconView)
		weatherIconView.setCenterX(inView: self)
		weatherIconView.setAnchor(anchorTo: [.top(padding: 30, isToSafeArea: true)], inView: self)
	}
	
	private func configStackView() {
		let tempStack = UIStackView(byViews: [temp, feelsLike], isHorizontal: true, eachSpace: 15)
		let tempRangeStack = UIStackView(byViews: [tempMin, tempMax], isHorizontal: true, eachSpace: 15)
		let atmosStack = UIStackView(byViews: [pressure, windSpeed], isHorizontal: true, eachSpace: 15)
		let wholeStack = UIStackView(byViews: [cityName, tempStack, tempRangeStack, atmosStack, humidLabel, descriptionLabel], isHorizontal: false, eachSpace: 45)
		
		addSubview(wholeStack)
		wholeStack.setAnchorTRBL(top: weatherIconView.bottomAnchor, paddingTop: 50)
		wholeStack.setCenterX(inView: self)
	}
	
	public func updateImage(weatherIcon: UIImage) {
		weatherIconView.image = weatherIcon
	}
	
	public func updateUI(weatherInfoForEach: WeatherInfoForEach) {
		cityName.text = "도시 : " + weatherInfoForEach.cityName
		temp.text = "현재 기온 : " + weatherInfoForEach.temp + "°C"
		feelsLike.text = "체감 기온 : " + weatherInfoForEach.feelsLike + "°C"
		tempMax.text = "최고 기온 : " + weatherInfoForEach.tempMax + "°C"
		tempMin.text = "최저 기온 : " + weatherInfoForEach.tempMin + "°C"
		pressure.text = "기압 : " + weatherInfoForEach.pressure + "hPa"
		windSpeed.text = "풍속 : " + weatherInfoForEach.windSpeed + "m/s"
		humidLabel.text = "현재 습도 : " + weatherInfoForEach.humidity + "%"
		descriptionLabel.text = "현재 " + "\(weatherInfoForEach.description) 상태입니다!"
	}
}
