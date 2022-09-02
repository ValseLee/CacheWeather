//
//  FirstTableViewCell.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import UIKit

final class FirstTableViewCell: UITableViewCell {
	private let weatherImage: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleToFill
		iv.clipsToBounds = true
		iv.setSize(height: 36, width: 36)
		iv.layer.cornerRadius = 36 / 2
		iv.image = UIImage(systemName: "heart")
		return iv
	}()
	
	private let cityName: UILabel = {
		let la = UILabel()
		la.text = "!!"
		la.font = .systemFont(ofSize: 32)
		return la
	}()
	
	private let temperature: UILabel = {
		let la = UILabel()
		la.textColor = .systemPurple
		la.text = "!!"
		la.font = .systemFont(ofSize: 32)
		return la
	}()
	
	private let humidity: UILabel = {
		let la = UILabel()
		la.textColor = .systemBlue
		la.text = "!!!"
		la.font = .systemFont(ofSize: 32)
		return la
	}()
	
	// MARK: Lifecycle	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.backgroundColor = .white
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configUI() {
		configWeatherImage()
		configStackViews()
	}
	
	func configWeatherImage() {
		addSubview(weatherImage)
		weatherImage.setCenterY(inView: self)
		weatherImage.setAnchor(anchorTo: [.leading(padding: 30, isToSafeArea: true)], inView: self)
	}
	
	func configStackViews() {
		let stack = UIStackView(arrangedSubviews: [cityName, temperature, humidity])
		stack.axis = .horizontal
		stack.alignment = .center
		stack.distribution = .fillEqually
		stack.spacing = 15
		addSubview(stack)
		
		stack.setAnchor(anchorTo: [.trailing(padding: 30, isToSafeArea: true)], inView: self)
		stack.setCenterY(inView: self)
	}
}
