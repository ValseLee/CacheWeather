//
//  WeatherIconView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/03.
//

import Foundation
import UIKit

struct WeatherViewModel {
	var weatherIcon: UIImage?
	
	var cityName: UILabel
	var temperature: UILabel
	var humidity: UILabel
	var curruntTemp: UILabel
	var bodyFeelTemp: UILabel
	var minTemp: UILabel
	var maxTemp: UILabel
	var atmosPress: UILabel
	var windSpeed: UILabel
}
