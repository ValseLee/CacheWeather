//
//  SeconcdViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class SeconcdViewController: UIViewController {
	private let weatherDetailView = WeatherDetailView()
	private var cityName: String?
	
	init(cityName: String) {
		super.init(nibName: nil, bundle: nil)
		self.cityName = cityName
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let cityName = cityName else { return }
		configNavBarUI(withTitle: "\(cityName)", prefersLargerTitle: true, isHidden: false)
		view.backgroundColor = .white
		configUI()
    }
	
	func configUI() {
		view.addSubview(weatherDetailView)
		weatherDetailView.setAnchor(anchorTo: [.top(padding: 15, isToSafeArea: true)], inView: view)
		weatherDetailView.setCenterX(inView: view)
	}
}
