//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class MainViewController: UIViewController {
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
		self.viewModel?.mainViewControllerDelegate = self
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
		weatherTableView.setAnchorTRBL(top: view.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 10, paddingRight: 0, paddingBottom: -10, paddingLeft: 0)
		weatherTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "TABLE_CELL")
		weatherTableView.isScrollEnabled = true
		weatherTableView.dataSource = self
		weatherTableView.delegate = self
		weatherTableView.rowHeight = CGFloat(75)
	}
	
	// MARK: Networks
	func updateUI() {
		DispatchQueue.main.async {
			UIView.transition(with: self.weatherTableView,
							  duration: 0.45,
							  options: .transitionCrossDissolve) {
				self.activeIndicator.removeFromSuperview()
				self.weatherTableView.reloadData()
			}
		}
	}
}

extension MainViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (viewModel?.weatherInfoList.count)!
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as! MainTableViewCell
		let weatherInfoArray = viewModel!.weatherInfoList[indexPath.row]
		let weatherInfoForEach = WeatherInfoForEach.init(weatherInfo: weatherInfoArray, setViewModel: viewModel!)
		
		cell.weatherIcon.image = weatherInfoForEach.getIconImage()
		cell.temp.text = weatherInfoForEach.temp + "°C"
		cell.cityName.text = weatherInfoForEach.cityName
		cell.humidity.text = weatherInfoForEach.humidity + "%"
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let weatherInfoArray = viewModel?.weatherInfoList[indexPath.row]
		let weatherInfoForEach = WeatherInfoForEach.init(weatherInfo: weatherInfoArray!, setViewModel: viewModel!)
		
		let vc = DetailViewController(cityName: weatherInfoForEach.cityName, viewModel: viewModel!, weatherInfo: weatherInfoForEach)
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension MainViewController: UITableViewDelegate {
	// code
}
