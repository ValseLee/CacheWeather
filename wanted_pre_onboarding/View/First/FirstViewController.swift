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
	
	init(setViewModel: WeatherDetailViewModel) {
		super.init(nibName: nil, bundle: nil)
		self.viewModel = setViewModel
		self.viewModel?.firstViewControllerdelegate = self
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
	func updateUI() {
		DispatchQueue.main.async {
			UIView.transition(with: self.weatherTableView,
							  duration: 0.55,
							  options: .transitionCrossDissolve) {
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
		let weatherArray = viewModel!.weatherInfoList[indexPath.row]
//
//		let image = weatherArray.weather[0].icon
//		let imageUrl = "https://openweathermap.org/img/wn/\(image)@2x.png"
//		let imageData = try? Data(contentsOf: URL(string: "\(imageUrl)")!)
//
//		cell.weatherIcon.image = UIImage(data: imageData!)!
		cell.temp.text = String(weatherArray.main.temp)
		cell.humidity.text = String(weatherArray.main.humidity)
		cell.cityName.text = String(weatherArray.name)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let arr = viewModel?.weatherInfoList[indexPath.row]
		let vc = SeconcdViewController(cityName: arr!.name)
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension FirstViewController: UITableViewDelegate {
	// code
}
