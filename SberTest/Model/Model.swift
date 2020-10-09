import SwiftUI
import CoreLocation

final class UserData: ObservableObject {
	@Published var feedURL: String = "https://www.banki.ru/xml/news.rss"
	@Published var feeds = FeedData.shared
	@Published var feed = FeedDataObject.init(title: FeedData.shared.title, pubDate: FeedData.shared.pubDate, description: FeedData.shared.itemDescription)
	static var shared = UserData()
}
// MARK: - News Model
class FeedDataObject: Identifiable, ObservableObject {
	@Published var id = UUID().uuidString
	var title: String
	var pubDate: String
	var description: String
	var url: URL?
	private var _isRead: Bool?
	var isRead: Bool {
		get { _isRead ?? false }
		set { _isRead = newValue }
	}
	init(title: String, pubDate: String, description: String) {
		self.title = title
		self.pubDate = pubDate
		self.description = description
		self._isRead = isRead
	}
}
