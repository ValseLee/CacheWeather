//
//  CustomWeatherInfoLabelView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/05.
//

import UIKit

final class CustomWeatherInfoLabel: UILabel {
	
	init(category: Category) {
		super.init(frame: .zero)
		font = .boldSystemFont(ofSize: 16)
		
		switch category {
			case .temp:
				textColor = .black
			case .feelsLike:
				textColor = .orange
			case .tempMin:
				textColor = .systemBlue
			case .tempMax:
				textColor = .systemRed
			case .pressure:
				textColor = .systemBlue
			case .humidity:
				textColor = .systemBlue
			case .windSpeed:
				textColor = .systemPurple
			case .cityName:
				textColor = .black
			case .description:
				textColor = .black
				font = .boldSystemFont(ofSize: 24)
				lineBreakMode = .byWordWrapping
			case .cityNameLarge:
				textColor = .black
				font = .boldSystemFont(ofSize: 24)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	enum Category {
		case cityName
		case temp
		case feelsLike
		case tempMin
		case tempMax
		case pressure
		case humidity
		case windSpeed
		case description
		case cityNameLarge
	}
}
