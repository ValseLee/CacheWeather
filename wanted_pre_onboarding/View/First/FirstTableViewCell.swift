//
//  FirstTableViewCell.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class FirstTableViewCell: UITableViewCell {
	private var weatherIcon: WeatherIconView = {
		let iv = WeatherIconView(weatherIcon: UIImage(systemName: "heart"), size: 45)
		return iv
	}()
	
	private let cityName: UILabel = {
		let la = UILabel()
		la.text = "!!"
		la.font = .systemFont(ofSize: 32)
		return la
	}()
	
	private let curruntTemp: UILabel = {
		let la = UILabel()
		la.textColor = .systemPurple
		la.text = "!!"
		la.font = .systemFont(ofSize: 32)
		return la
	}()
	
	private let humidity: UILabel = {
		let la = UILabel()
		la.textColor = .systemBlue
		la.text = "!!!"
		la.font = .systemFont(ofSize: 32)
		return la
	}()
	
	// MARK: Lifecycle	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.backgroundColor = .white
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
		weatherIcon.setAnchor(anchorTo: [.leading(padding: 50, isToSafeArea: true)], inView: self)
	}
	
	func configStackViews() {
		let stack = UIStackView(arrangedSubviews: [cityName, curruntTemp, humidity])
		stack.axis = .horizontal
		stack.alignment = .center
		stack.distribution = .fillEqually
		stack.spacing = 30
		addSubview(stack)
		
		stack.setAnchor(anchorTo: [.trailing(padding: 30, isToSafeArea: true)], inView: self)
		stack.setCenterY(inView: self)
	}
}
