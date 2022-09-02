//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class FirstViewController: UIViewController {
	
	private let mainLabel: UILabel = {
		let la = UILabel()
		la.text = "Wanted Pre Onboarding"
		la.font = .boldSystemFont(ofSize: 28)
		return la
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		configUI()
	}
	
	// MARK: Configs
	func configUI() {
		configMainLabelView()
		configTableView()
		configNavBarUI(withTitle: "One Weather", prefersLargerTitle: true, isHidden: false)
	}
	
	func configMainLabelView() {
		view.addSubview(mainLabel)
		mainLabel.setAnchor(anchorTo: [.top(padding: 30, isToSafeArea: true)], inView: view)
		mainLabel.setCenterX(inView: view)
	}
	
	func configTableView() {
		let tv = UITableView(frame: .zero)
		view.addSubview(tv)
		tv.setAnchorTRBL(top: mainLabel.bottomAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, paddingTop: 50, paddingBottom: -10)
		tv.register(FirstTableViewCell.self, forCellReuseIdentifier: "TABLE_CELL")
		tv.isScrollEnabled = true
		tv.dataSource = self
		tv.delegate = self
		tv.rowHeight = CGFloat(75)
	}
	
	// MARK: Selectors
	
	
}

extension FirstViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as! FirstTableViewCell
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = SeconcdViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension FirstViewController: UITableViewDelegate {
	
}
