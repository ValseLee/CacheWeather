//
//  ImageProvider.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/05.
//

import UIKit

final class ImageProvider {
	static let shared = ImageProvider()
	public let weatherIconCache: NSCache = NSCache<NSString, UIImage>()

	public func loadImage(imageURL: String, cityName: String, completion: @escaping (UIImage?) -> Void) {
		if let image = weatherIconCache.object(forKey: "\(imageURL + cityName)" as NSString) {
			completion(image)
			return
		}
		
		guard let safeUrl = URL(string: imageURL) else { return }
		if let imageData = try? Data(contentsOf: URL(string: "\(safeUrl)")!) {
			let image = UIImage(data: imageData)
			weatherIconCache.setObject(image!, forKey: "\(imageURL + cityName)" as NSString)
			completion(image)
			return
		}
	}
	
	public func getWeatherIconCache() -> NSCache<NSString, UIImage> {
		weatherIconCache
	}
	
	private init() {}
}
