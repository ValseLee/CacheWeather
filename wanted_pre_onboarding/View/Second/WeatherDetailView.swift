//
//  SecondView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class WeatherDetailView: UIView {
	private let weatherIcon: UIImageView = {
		let iv = UIImageView()
		iv.setSize(height: 56, width: 56)
		iv.layer.cornerRadius = 56 / 2
		iv.contentMode = .scaleToFill
		iv.clipsToBounds = true
		iv.image = UIImage(systemName: "heart")!
		return iv
	}()
	
	private let curruntTemp: UILabel = {
		let la = UILabel()
		return la
	}()
	
	private let bodyFillTemp: UILabel = {
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
		configWeatherIcon()
	}
	
	func configWeatherIcon() {
		addSubview(weatherIcon)
		weatherIcon.setCenterX(inView: self)
	}
	
	func configStackView() {
//		let stack = UIStackView(arrangedSubviews: [])
	}
}
