//
//  FirstTableViewCell.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class MainTableViewCell: UITableViewCell {

	public var weatherIcon: UIImageView = {
		return WeatherIconView(size: 50)
	}()
	
	public var cityName: UILabel = {
		return CustomWeatherInfoLabel(category: .cityName)
	}()
	
	public var temp: UILabel = {
		return CustomWeatherInfoLabel(category: .temp)
	}()
	
	public var humidity: UILabel = {
		return CustomWeatherInfoLabel(category: .humidity)
	}()
	
	// MARK: Lifecycle
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configUI() {
		configWeatherIconView()
		configStackViews()
	}
	
	func configWeatherIconView() {
		addSubview(weatherIcon)
		weatherIcon.setCenterY(inView: self)
		weatherIcon.setAnchor(anchorTo: [.leading(padding: 30, isToSafeArea: true)], inView: self)
	}
	
	func configStackViews() {
		let sv = UIStackView(byViews: [cityName, temp, humidity], isHorizontal: true, eachSpace: 15)
		addSubview(sv)		
		sv.setAnchor(anchorTo: [.trailing(padding: 30, isToSafeArea: true)], inView: self)
		sv.setCenterY(inView: self)
	}
}
