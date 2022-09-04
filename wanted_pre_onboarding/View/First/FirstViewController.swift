//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class FirstViewController: UIViewController {
	private let networkManager = WeatherNetwork.shared
	private let weatherTableView = UITableView(frame: .zero)
	private lazy var weatherDataList = [WeatherInfoList]()
	private lazy var viewModel = WeatherDetailViewModel()
	
	private let mainLabel: UILabel = {
		let la = UILabel()
		la.text = "Wanted Pre Onboarding"
		la.font = .boldSystemFont(ofSize: 28)
		return la
	}()

	// MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		configUI()
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setupData()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configs
	func configUI() {
		configMainLabelView()
		configNavBarUI(withTitle: "One Weather", prefersLargerTitle: true, isHidden: false)
		configTableView()
	}
	
	func configMainLabelView() {
		view.addSubview(mainLabel)
		mainLabel.setAnchor(anchorTo: [.top(padding: 30, isToSafeArea: true)], inView: view)
		mainLabel.setCenterX(inView: view)
	}
	
	func configTableView() {
		view.addSubview(weatherTableView)
		weatherTableView.setAnchorTRBL(top: mainLabel.bottomAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, paddingTop: 50, paddingBottom: -10)
		weatherTableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "TABLE_CELL")
		weatherTableView.isScrollEnabled = true
		weatherTableView.dataSource = self
		weatherTableView.delegate = self
		weatherTableView.rowHeight = CGFloat(75)
	}
	
	// MARK: Networks
	func setupData() {
		networkManager.fetchWeatherData { (result) in
			switch result {
				case .success(let result):
					self.weatherDataList = result as! [WeatherInfoList]
					DispatchQueue.main.async {
						UIView.transition(with: self.weatherTableView,
										  duration: 0.55,
										  options: .transitionCrossDissolve) {
							self.weatherTableView.reloadData()
						}
					}
				case .failure(let error):
					print(error)
			}
		}
	}
	
	
	// MARK: Selectors

}

extension FirstViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return weatherDataList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as! FirstTableViewCell
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = SeconcdViewController()
		let arr = weatherDataList[indexPath.row]
		dump(arr)
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension FirstViewController: UITableViewDelegate {
	// code
}
