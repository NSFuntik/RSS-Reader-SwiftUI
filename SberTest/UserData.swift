//
//  UserData.swift
//  SberTest
//
//  Created by Mikhailov on 07.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
	@Published var landmarks = landmarkData
	
}

//let newsData
//class loadNews {
//	static var shared = loadNews()
//	private init() {}
//	let xmlParser = XMLParserService()
//	public var news: [News] = []
//	//MARK: - Private functions
//	private func loadData() {
//		xmlParser.parse { (news) in
//
//			self.news = news
//			//self.cellStates = Array(repeating: .collapsed, count: news.count)
////			OperationQueue.main.addOperation {
////				self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
////			}
//		}
//	}
//}
