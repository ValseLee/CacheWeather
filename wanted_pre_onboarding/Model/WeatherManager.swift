//
//  WeatherManager.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import Foundation

final class WeatherNetwork {
//	static let shared = WeatherNetwork()
	typealias NetworkCompletion = (Result<Any, NetworkError>) -> Void
	
	func startNetwork(_ cities: [String], completion: @escaping NetworkCompletion) {
		let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&appid=7f55bd940bdfc44417b670cd85cbccac&lang=kr"
		
		performRequest(with: urlString) { result in
			completion(result)
		}
	}
	
	private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
		guard let url = URL(string: urlString) else { return }
		let session = URLSession(configuration: .default)
		
		let task = session.dataTask(with: url) { data, response, error in
			guard error == nil else {
				completion(.failure(.networkingError))
				return
			}
			guard let safeData = data else {
				completion(.failure(.dataError))
				return
			}
			
			guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
				completion(.failure(.requestError))
				return
			}
			
			
		}
		task.resume()
	}
}

// MARK: Error Enum
enum NetworkError: Error {
	case networkingError
	case dataError
	case parseError
	case requestError
}
