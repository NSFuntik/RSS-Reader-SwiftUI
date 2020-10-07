import UIKit
import SwiftUI
import CoreLocation

/*
class XMLParserService: NSObject, XMLParserDelegate {
	private let sourceURL: URL = URL(string: "https://www.banki.ru/xml/news.rss")!
	private var items: [News] = []
	private var completion: (([News]) -> ())?
	private var currentElement: String = ""
	@Published var itemStore: [News]? //<-
	static let shared = XMLParserService()
	private override init() { }

	private var id: Int = 0
	func inc() -> Int {
		id = id + 1
		return id
	}
	private var currentId: String = ""
	private var currentTitle: String = "" {
		didSet{
			currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		}
	}
	private var currentDescription: String = "" {
		didSet{
			currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		}
	}
	private var currentPubDate: String = "" {
		didSet{
			currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		}
	}
	
	func parseData(completion: (([News]) -> ())?) {
		self.completion = completion
		let task = URLSession.shared.dataTask(with: sourceURL) { (data, response, error) in
			guard error == nil else { return }
			guard let data = data else { return }
			let parser = XMLParser(data: data)
			parser.delegate = self
			parser.parse()
			//self.itemStore = self.items
			//print(self.itemStore)
		}
		task.resume()
	}
	
	//MARK: - XML Parse Delegate
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		currentElement = elementName
		if currentElement == "item" {
			//currentId = ""
			currentTitle = ""
			currentDescription = ""
			currentPubDate = ""
		}
	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {
		switch currentElement {
			//case "id": currentId += string
			case "title": currentTitle += string
			case "description": currentDescription += string
			case "pubDate": currentPubDate += string
			default:
				break
		}
	}
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		if elementName == "item" {
			self.items.append(News(id: inc(), title: currentTitle, description: currentDescription, pubDate: currentPubDate))
		}
	}
	
	func parserDidEndDocument(_ parser: XMLParser) {
		self.completion?(items)
	}
	
	func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
		print(parseError.localizedDescription)
	}
}
*/
