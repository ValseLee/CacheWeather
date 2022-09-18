//
//  CityLIst.swift
//  wanted_pre_onboarding
//
//  Created by 이승준 on 2022/09/04.
//

import Foundation

struct CityList {
	typealias cityListJson = [[String : Any]]
	private let cityList: cityListJson = [
		[
			"id": 1842616,
			"name": "Gongju"
		],
		[
			"id": 1841808,
			"name": "Gwangju"
		],
		[
			"id": 1842225,
			"name": "Gumi"
		],
		[
			"id": 1842025,
			"name": "Gunsan"
		],
		[
			"id": 1835327,
			"name": "Daegu"
		],
		[
			"id": 1835224,
			"name": "Daejeon"
		],
		[
			"id": 1841066,
			"name": "Mokpo"
		],
		[
			"id": 1838519,
			"name": "Busan"
		],
		[
			"id": 1835895,
			"name": "Seosan"
		],
		[
			"id": 1835847,
			"name": "Seoul"
		],
		[
			"id": 1836553,
			"name": "Sokcho"
		],
		[
			"id": 1835553,
			"name": "Suwon"
		],
		[
			"id": 1835648,
			"name": "Suncheon"
		],
		[
			"id": 1833742,
			"name": "Ulsan"
		],
		[
			"id": 1843491,
			"name": "Iksan"
		],
		[
			"id": 1845457,
			"name": "Jeonju"
		],
		[
			"id": 1846266,
			"name": "Jeju City"
		],
		[
			"id": 1845759,
			"name": "Cheonan"
		],
		[
			"id": 1845604,
			"name": "Cheongju-si"
		],
		[
			"id": 1845136,
			"name": "Chuncheon"
		]
	]
	
	public func getCityId() -> String {
		let cityIdList = cityList.compactMap { $0["id"] } as! [Int]
		let cityIdString = cityIdList.map { String($0) }.joined(separator: ",")
		return cityIdString
	}
}
