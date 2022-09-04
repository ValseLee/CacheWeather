//
//  SeconcdViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class SeconcdViewController: UIViewController {
	private let weatherDetailView = WeatherDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
		configNavBarUI(withTitle: "Seoul", prefersLargerTitle: true, isHidden: false)
		view.backgroundColor = .white
		configUI()
    }
	
	func configUI() {
		view.addSubview(weatherDetailView)
		weatherDetailView.setAnchor(anchorTo: [.top(padding: 15, isToSafeArea: true)], inView: view)
		weatherDetailView.setCenterX(inView: view)
	}
	
	func setupView() {
		weatherDetailView.setupView()
	}
    
}
