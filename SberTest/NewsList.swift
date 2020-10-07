//
//  SwiftUIView.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

//let landmarkData: [News] = XMLParserService.shared.itemStore!
//var newsData: [News] = []


struct NewsList: View {
	var postData: [FeedDataObject] = []
	@ObservedObject var userData: FeedData

	var body: some View {
		NavigationView {
				List {
					ForEach(userData.RssPosts) { item in //<-
						NavigationLink(destination: NewsDetail(userData: FeedData.shared, landmark: item)) {
							NewsRow(userData: userData, landmark: item)
						}
					}
				} .navigationBarTitle((Text("News")), displayMode: .large)
		}

	}
	init(rssPostData: FeedData) {
		postData = []
		self.userData = FeedData()
		let appearance = UINavigationBarAppearance()
		appearance.configureWithTransparentBackground()
	}
}

//func loadData() {
//	XMLParserService.shared.parseData { (news) in
		
//		newsData = (news)
		//newsData.append(contentsOf: news)
		//self.cellStates = Array(repeating: .collapsed, count: news.count)
		//		OperationQueue.main.addOperation {
		//			self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
		//		}
		//		dump(newsData.description)
//	}
//}

struct SwiftUIView_Previews: PreviewProvider {
	static var previews: some View {
		NewsList(rssPostData: FeedData())
		//.environmentObject(FeedData())
	}
}
