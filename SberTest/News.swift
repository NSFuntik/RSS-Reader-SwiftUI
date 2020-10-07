//
//  News.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI
import CoreLocation
// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome5 = try Welcome5(json)


// MARK: - Item
struct News: Hashable, Codable, Identifiable {
	var id: String
	let num: Int?
	let title: String
	let description: String
	let pubDate: String
	private var _isRead: Bool?
	var isRead: Bool {
		get {
			_isRead ?? false
		}
		set {
			_isRead = newValue
		}
	}}

extension News {
	
}
//	let sourceName: SourceName
//	let sourceURL, link: String
//	let category: Category
//	let guid: String
//	let synopsis: Synopsis
//	let bankID, bankName: String?
//	let image: ItemImage?

//// MARK: - Welcome5
//struct Welcome5 {
//	let rss: RSS
//}
//
//// MARK: - RSS
//struct RSS {
//	let channel: Channel
//	let version: String
//}
//
//// MARK: - Channel
//struct Channel {
//	let title: String
//	let link: String
//	let channelDescription, language, lastBuildDate, ttl: String
//	let image: ChannelImage
//	let item: [Item]
//}
//
//// MARK: - ChannelImage
//struct ChannelImage {
//	let title: String
//	let url: String
//	let link: String
//}
//enum Category {
//	case лентаНовостей
//}
//
//// MARK: - ItemImage
//struct ItemImage {
//	let url: String
//}
//
//enum SourceName {
//	case bankiRu
//	case прайм
//	case тасс
//}
//
//// MARK: - Synopsis
//struct Synopsis {
//	let cdata: String
//}

