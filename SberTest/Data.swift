//
//  Data.swift
//  SberTest
//
//  Created by Mikhailov on 07.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation
import Alamofire
import SwiftyXMLParser

//let landmarkData: [FeedDataObject] = load("news.json")
//func load<T: Decodable>(_ filename: String) -> T {
//	let data: Data
//
//	guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//		else {
//			fatalError("Couldn't find \(filename) in main bundle.")
//	}
//
//	do {
//		data = try Data(contentsOf: file)
//	} catch {
//		fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//	}
//
//	do {
//		let decoder = JSONDecoder()
//		let result = try decoder.decode(T.self, from: data)
//		return result
//	} catch {
//		fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//	}
//}

//let feedData: [News] = loadFeed("newsData.xml")
//func loadFeed<T: Decodable>(_ filename: String) -> T {
//	let data: Data
//
//	guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//	else {
//		fatalError("Couldn't find \(filename) in main bundle.")
//	}
//
//	do {
//		data = try Data(contentsOf: file)
//	} catch {
//		fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//	}
//
//	do {
//		let xml = try! XML.parse(data)
//		let element = xml.ResultSet.Result.map { (xml) -> T in
//
//		}
//		//let result = try decoder.decode(T.self, from: data)
//		return element
//	} catch {
//		fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//	}
//}

//func loadRSS() {
//
//	let feedString:String = "https://news.google.com/news?hl=us&ned=us&ie=UTF-8&oe=UTF-8&output=rss"
//
//	AF.request(feedString).response() { (response) -> Void in
//		if let feed: RSSFeed = response.value {
//			/// Do something with your new RSSFeed object!
//			for item in feed.items {
//				print(item)
//			}
//		}
//	}
//}
