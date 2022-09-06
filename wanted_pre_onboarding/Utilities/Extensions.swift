//
//  Extensions.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import Foundation
import UIKit

// MARK: UIView
extension UIView {
	/*
	 Layout Extensions
	 Anchoring
	 Centering
	*/
	enum AnchorTo {
		case top(padding: CGFloat, isToSafeArea: Bool)
		case bottom(padding: CGFloat, isToSafeArea: Bool)
		case leading(padding: CGFloat, isToSafeArea: Bool)
		case trailing(padding: CGFloat, isToSafeArea: Bool)
	}
	
	func setAnchor(anchorTo: [AnchorTo], inView view: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		anchorTo.forEach { direction in
			switch direction {
				case .top(let padding, let isToSafeArea):
					if isToSafeArea {
						self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
					} else {
						self.topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
					}
					break
				case .bottom(let padding, let isToSafeArea):
					if isToSafeArea {
						self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding).isActive = true
					} else {
						self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
					}
					break
				case .leading(let padding, let isToSafeArea):
					if isToSafeArea {
						self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
					} else {
						self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
					}
					break
				case .trailing(let padding, let isToSafeArea):
					if isToSafeArea {
						self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
					} else {
						self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
					}
					break
			}
		}
	}
	
	func setAnchorTRBL(
		top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
		paddingTop: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeft: CGFloat = 0) {
			
			translatesAutoresizingMaskIntoConstraints = false
			
			if let top = top {
				topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
			}
			
			if let right = right {
				rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
			}
			
			if let bottom = bottom {
				bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
			}
			
			if let left = left {
				leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
			}
		}
	
	func setSize(height: CGFloat, width: CGFloat) {
		translatesAutoresizingMaskIntoConstraints = false
		heightAnchor.constraint(equalToConstant: height).isActive = true
		widthAnchor.constraint(equalToConstant: width).isActive = true
	}
	
	func setCenterY(inView view: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
	func setCenterX(inView view: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
}


// MARK: UIViewController
extension UIViewController {
	func configNavBarUI(withTitle title: String, prefersLargerTitle: Bool, isHidden: Bool) {
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
		appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
		appearance.backgroundColor = .white
		
		navigationController?.navigationBar.standardAppearance = appearance
		navigationController?.navigationBar.compactAppearance = appearance
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
		
		navigationController?.navigationBar.prefersLargeTitles = prefersLargerTitle
		navigationController?.navigationBar.tintColor = .black
		navigationController?.navigationBar.isTranslucent = true
		
		navigationController?.navigationBar.isHidden = isHidden
		navigationItem.title = title
	}
}

// MARK: UIStackView
extension UIStackView {
	convenience init(byViews: [UIView], isHorizontal: Bool, eachSpace: Int) {
		self.init(arrangedSubviews: byViews)
		spacing = CGFloat(eachSpace)
		alignment = .center
		distribution = .equalSpacing
		if isHorizontal {
			axis = .horizontal
		} else {
			axis = .vertical
		}
	}
}
