//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class FirstViewController: UIViewController {
	private let weatherTableView = UITableView(frame: .zero)
	private var viewModel: WeatherDetailViewModel?
	private var activeIndicator = UIActivityIndicatorView(style: .large)
	
	// MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		configUI()
	}
	
	init(setViewModel: WeatherDetailViewModel) {
		super.init(nibName: nil, bundle: nil)
		self.viewModel = setViewModel
		self.viewModel?.firstViewControllerDelegate = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configs
	private func configUI() {
		configNavBarUI(withTitle: "One Weather", prefersLargerTitle: true, isHidden: false)
		configTableView()
	}
	
	private func activateIndicator() {
		weatherTableView.addSubview(activeIndicator)
		activeIndicator.color = .systemPink.withAlphaComponent(0.4)
		activeIndicator.setCenterX(inView: weatherTableView)
		activeIndicator.setCenterY(inView: view)
		activeIndicator.startAnimating()
	}
	
	private func configTableView() {
		view.addSubview(weatherTableView)
		activateIndicator()
		weatherTableView.setAnchorTRBL(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingRight: 0, paddingBottom: -10, paddingLeft: 0)
		weatherTableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "TABLE_CELL")
		weatherTableView.isScrollEnabled = true
		weatherTableView.dataSource = self
		weatherTableView.delegate = self
		weatherTableView.rowHeight = CGFloat(75)
	}
	
	// MARK: Networks
	func updateUI() {
		DispatchQueue.main.async {
			UIView.transition(with: self.weatherTableView,
							  duration: 0.55,
							  options: .transitionCrossDissolve) {
				self.activeIndicator.removeFromSuperview()
				self.weatherTableView.reloadData()
			}
		}
	}
}

extension FirstViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (viewModel?.weatherInfoList.count)!
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as! FirstTableViewCell
		let weatherInfoArray = viewModel!.weatherInfoList[indexPath.row]
		let icon = weatherInfoArray.weather[0].icon
		let imageUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
		
		cell.weatherIcon.image = viewModel?.loadCacheImage(url: imageUrl, cityName: weatherInfoArray.name)
		cell.temp.text = String(weatherInfoArray.main.temp) + "°C"
		cell.humidity.text = "습도: " + String(weatherInfoArray.main.humidity) + "%"
		cell.cityName.text = String(weatherInfoArray.name)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let weatherInfoArray = viewModel?.weatherInfoList[indexPath.row]
		let vc = SeconcdViewController(cityName: weatherInfoArray!.name, viewModel: viewModel!, weatherInfoArray: weatherInfoArray!)		
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension FirstViewController: UITableViewDelegate {
	// code
}
