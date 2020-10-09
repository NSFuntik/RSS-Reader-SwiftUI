import UIKit
import SwiftUI
import CoreLocation
import Combine

final class UserData: ObservableObject {
	@Published var feedURL: String = "https://www.banki.ru/xml/news.rss"
	@Published var feeds = FeedData.shared
}

class FeedData: NSObject, XMLParserDelegate, ObservableObject {
	@Published var generalURL: URL!
	@Published var rssPosts = [FeedDataObject]()
	//var feedURL: URL = URL(string: UserData)
	@Published var isRead: Bool = Bool()
	var title: String = String()
	var pubDate : String = String()
	var itemDescription: String = String()
	var elementName: String = String()

	static let shared = FeedData()
	override init() {	}

	required init(generalURL: URL) {
		super.init()
		self.generalURL = generalURL
		getData(generalURL: generalURL)
	}
	//private var RssPost = FeedDataObject(title: shared.title , pubDate: shared.itemDescription, description: shared.pubDate)
	
	
	func getData(generalURL: URL){
		print("lol did this work???")
		
		let task = URLSession.shared.dataTask(with: generalURL) { [self] data, response, error in
			guard let _ = data, error == nil else {
				print(error ?? "Unknown error")
				return
			}
			
			DispatchQueue.main.async {
				if let parser = XMLParser(contentsOf: self.generalURL){
					parser.delegate = self
					if parser.parse() {
						print()
					}
					print("oh hello!")
				}
			}
		}
		task.resume()
		
	}
	

//	override init() {
//		super.init()
//		getData(generalURL: generalURL)
//	}


	
	//parser delegate methods
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		if elementName == "item" {
			title = String()
			pubDate = String()
			itemDescription = String()
			self.isRead = false
		}
		
		self.elementName = elementName
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		if elementName == "item"{
			let dataObj = FeedDataObject(title: title, pubDate: pubDate, description: itemDescription)
			rssPosts.append(dataObj)
			dump(dataObj)
		}
	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {
		let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		
		if(!data.isEmpty){
			switch self.elementName {
				case "title":
					title += data
				case "description":
					itemDescription += data
				case "pubDate":
					pubDate += data
				default: break
			}
		}
	}
	
	func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
		print(parseError)
		
	}
	
	
}
extension FeedData {
	func refreshData(feed: FeedData) {
		let newFeed = FeedData.shared
		let recentFeedPosts = newFeed.rssPosts.filter { newPost in
			return !feed.rssPosts.contains { (post) -> Bool in
				return post.title == newPost.title
			}
		}
		guard !recentFeedPosts.isEmpty else { return }
		
		feed.rssPosts.insert(contentsOf: recentFeedPosts, at: 0)
		
		if let index = self.rssPosts.firstIndex(where: {$0.url?.absoluteString == feed.generalURL.absoluteString}) {
			self.rssPosts.remove(at: index)
			self.rssPosts.insert(contentsOf: newFeed.rssPosts, at: 0)
			
		}
		//self.updateFeeds()
	}

}
