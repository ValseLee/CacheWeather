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
	}
	
	func configMainLabelView() {
		view.addSubview(mainLabel)
		mainLabel.setAnchor(anchorTo: [.top(padding: 30, isToSafeArea: true)], inView: view)
		mainLabel.setCenterX(inView: view)
	}
	
	func configTableView() {
		let tv = UITableView(frame: .zero)
		tv.setAnchorTRBL(top: mainLabel.bottomAnchor, paddingTop: 15)
		tv.dataSource = self
		tv.delegate = self
	}
	
	// MARK: Selectors
	
	
}

extension FirstViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as UITableViewCell
		return cell
	}
	
	
}

extension FirstViewController: UITableViewDelegate {
	
}
