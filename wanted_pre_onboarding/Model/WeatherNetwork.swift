//
//  WeatherManager.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/02.
//

import Foundation

final class WeatherNetwork {
	typealias NetworkCompletion = (Result<Any, NetworkError>) -> Void
	static let shared = WeatherNetwork()
	
	private let cityList = CityList()

	func fetchWeatherData(completion: @escaping NetworkCompletion) {
		let cityIdList = cityList.getCityId()
		let appid = "7f55bd940bdfc44417b670cd85cbccac"
		let urlString = "https://api.openweathermap.org/data/2.5/group?id=\(cityIdList)&units=metric&appid=\(appid)&lang=kr"
		
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
			
			if let weathers = self.parseJSON(safeData) {
				completion(.success(weathers))
			}
			else {
				completion(.failure(.parseError))
			}
		}
		task.resume()
	}
	
	private func parseJSON(_ resultData: Data) -> [WeatherInfoList]? {
		do {
			let decoder = JSONDecoder()
			let weather = try decoder.decode(WeatherInfo.self, from: resultData)
			let weatherInfoList = weather.list
			return weatherInfoList
		}
		catch {
			dump(error)
			return nil
		}
	}
	
	private init() {}
}

// MARK: Error Enum
enum NetworkError: Error {
	case networkingError
	case dataError
	case parseError
	case requestError
}
