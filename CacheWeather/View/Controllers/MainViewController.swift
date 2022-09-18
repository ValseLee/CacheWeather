//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class MainViewController: UIViewController {
	private let weatherTableView = UITableView(frame: .zero)
	private weak var viewModel: WeatherDetailViewModel?
    private var activeIndicator = UIActivityIndicatorView(style: .large)
	
	// MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .white
        setNotificationCenter()
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
		configNavBarUI(withTitle: "Cache Weather", prefersLargerTitle: true, isHidden: false)
		configTableView()
	}
	
	private func activateIndicator() {
		weatherTableView.addSubview(activeIndicator)
        self.view.isUserInteractionEnabled = false
		activeIndicator.color = .systemPink.withAlphaComponent(0.4)
        activeIndicator.backgroundColor = .clear.withAlphaComponent(0.075)
        activeIndicator.setSize(height: view.frame.height, width: view.frame.width)
		activeIndicator.setCenterX(inView: weatherTableView)
		activeIndicator.setCenterY(inView: view)
		activeIndicator.startAnimating()
	}
	
	private func configTableView() {
		view.addSubview(weatherTableView)
		weatherTableView.setAnchorTRBL(
            top: view.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor,
            paddingTop: 10, paddingRight: 0, paddingBottom: -10, paddingLeft: 0)
        activateIndicator()
		weatherTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "TABLE_CELL")
		weatherTableView.isScrollEnabled = true
		weatherTableView.dataSource = self
		weatherTableView.delegate = self
		weatherTableView.rowHeight = CGFloat(75)
	}
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadComplete), name: .imageLoadCompleted, object: nil)
    }
	
	// MARK: Networks
	public func updateUI() {
		DispatchQueue.main.async {
			UIView.transition(with: self.weatherTableView,
							  duration: 0.45,
							  options: .transitionCrossDissolve) {
				self.weatherTableView.reloadData()
			}
		}
	}
    
    // MARK: Selectors
    @objc func loadComplete() -> Void {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            self.activeIndicator.removeFromSuperview()
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
