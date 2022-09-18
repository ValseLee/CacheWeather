//
//  ImageProvider.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/05.
//

import UIKit

final class ImageProvider {
	static let shared = ImageProvider()
	private let weatherIconCache: NSCache = NSCache<NSString, UIImage>()
    private var imageCnt = 0

	public func loadImage(imageURL: String, cityName: String, completion: @escaping (UIImage?) -> Void) {
		DispatchQueue.global(qos: .userInteractive).async {
			if let image = self.weatherIconCache.object(forKey: "\(imageURL + cityName)" as NSString) {
				completion(image)
				return
			}
			
			guard let safeUrl = URL(string: imageURL) else { return }
			if let imageData = try? Data(contentsOf: URL(string: "\(safeUrl)")!) {
				let image = UIImage(data: imageData)
				self.weatherIconCache.setObject(image!, forKey: "\(imageURL + cityName)" as NSString)
				completion(image)
				return
			}
		}
	}
	
	// MARK: Image Init
	public func loadImage(imageURL: String, cityName: String) {
		if let _ = weatherIconCache.object(forKey: "\(imageURL + cityName)" as NSString) {
			return
		}
		
		guard let safeUrl = URL(string: imageURL) else { return }
		if let imageData = try? Data(contentsOf: URL(string: "\(safeUrl)")!) {
			let image = UIImage(data: imageData)
			weatherIconCache.setObject(image!, forKey: "\(imageURL + cityName)" as NSString)
            imageCnt += 1
            if imageCnt == 20 {
                NotificationCenter.default.post(name: .imageLoadCompleted, object: nil)
                imageCnt = 0
            }
			return
		}
	}
	
	public func getWeatherIconCache() -> NSCache<NSString, UIImage> {
		weatherIconCache
	}
    
	private init() {}
}
