//
//  weatherInfoView.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/04.
//

import Foundation
import UIKit

final class WeatherIconView: UIImageView {
	
	init(size: CGFloat) {
		super.init(frame: .zero)
		backgroundColor = .systemBlue.withAlphaComponent(0.2)
		setCenterY(inView: self)
		setCenterX(inView: self)
		setSize(height: size, width: size)
		contentMode = .scaleToFill
		clipsToBounds = true
		layer.cornerRadius = size / 2
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
