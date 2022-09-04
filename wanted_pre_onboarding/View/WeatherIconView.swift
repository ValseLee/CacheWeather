//
//  weatherInfoView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/04.
//

import Foundation
import UIKit

final class WeatherIconView: UIView {
	
	init(weatherIcon: UIImage?, size: CGFloat) {
		super.init(frame: .zero)
		backgroundColor = .none
		
		let iv = UIImageView()
		iv.image = weatherIcon
		iv.tintColor = .systemBlue
		
		addSubview(iv)
		iv.setCenterY(inView: self)
		iv.setCenterX(inView: self)
		
		iv.setSize(height: size, width: size)
		iv.layer.cornerRadius = size / 2
		iv.contentMode = .scaleToFill
		iv.clipsToBounds = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
