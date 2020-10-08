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
	@ObservedObject var feedData: FeedData

	//@ObservedObject var userData: UserData
	@State private var presentMe = false
	var landmark = FeedDataObject(title: FeedData.shared.title, pubDate: FeedData.shared.pubDate, description: FeedData.shared.itemDescription)
	//@State var isOpen: Bool = FeedData.shared.isRead
	var landmarkIndex: Int {
		feedData.rssPosts.firstIndex(where: { $0.id == landmark.id })!
	}
	
	var body: some View {
		NavigationView {
			List {
				ForEach(feedData.rssPosts) { landmark in //<-
					NavigationLink(destination: NewsDetail(userData: feedData, landmark: landmark)) {
						HStack{
							Button(action: {							
								landmark.isRead = true //$isRead = true
							}) {
								HStack {
									VStack(alignment: .leading, spacing: 5) {
										Text(landmark.title)
											.fontWeight(.bold)
											.lineLimit(4)
											.font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
											.padding(.horizontal, 3.0)
										Text(landmark.pubDate)
											.font(.caption)
											.fontWeight(.light)
											.multilineTextAlignment(.trailing)
											.padding(.leading, 130.0)
									}
									
								}
								
							}
							Spacer()
							if landmark.isRead == false {
								Image(systemName: "circle.fill")
									.imageScale(.small)
									.foregroundColor(.blue)
							}
						}
						
					}
				}
			} .navigationBarTitle((Text("News")), displayMode: .large)
			.preferredColorScheme(.dark)
			.foregroundColor(.gray)
		}
		.onAppear(){
			feedData.getData()
		}
	}
	
	init(rssPostData: FeedData) {
		postData = []
		self.feedData = FeedData()
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
		.environmentObject(FeedData())
	}
}
