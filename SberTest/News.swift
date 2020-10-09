//
//  News.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI
import CoreLocation

// MARK: - Item



class FeedDataObject: Identifiable, ObservableObject {
	@Published var id = UUID().uuidString
	var title: String
	var pubDate: String
	var description: String
	var url: URL?
	//var num: Int?
	private var _isRead: Bool?
	 var isRead: Bool {
		get {
			_isRead ?? false
		}
		set {
			_isRead = newValue
		}
	}
	
	init(title: String, pubDate: String, description: String) {
		self.title = title
		self.pubDate = pubDate
		self.description = description
		self._isRead = isRead
	}
}

//extension FeedDataObject: Hashable, Identifiable, ObservableObject {
//	@Published var id = UUID().uuidString
//}

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
