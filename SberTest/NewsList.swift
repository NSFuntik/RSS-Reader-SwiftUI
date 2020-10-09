//
//  SwiftUIView.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh
//let landmarkData: [News] = XMLParserService.shared.itemStore!
//var newsData: [News] = []


struct NewsList: View {
	//var postData: [FeedDataObject] = []
	//@ObservedObject var feedData: FeedData
	//@ObservedObject var userData: UserData
	@State private var presentMe = false
	//var landmark = FeedDataObject(title: FeedData.shared.title, pubDate: FeedData.shared.pubDate, description: FeedData.shared.itemDescription)
	//@State var isOpen: Bool = FeedData.shared.isRead
	@State private var isShowing = false
	@State private var isSheetPresented = false
	@State private var url: String = ""
	@ObservedObject var userData: UserData
	@State var feedData: FeedData
	
	//@ObservedObject var userData: FeedData
	private let lightGreyColor = Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)
	//	var landmarkIndex: Int {
	//		feedData.rssPosts.firstIndex(where: { $0.id == landmark.id })!
	//	}
	//  https://www.banki.ru/xml/news.rss
	
	var body: some View {
		NavigationView {
			VStack{
				HStack {
					TextField("Enter URL", text: $userData.feedURL)
						.padding(.leading, 5.0)
						.padding(.all, 5.0)
						.font(.body)
						.foregroundColor(lightGreyColor)
						.background(
							RoundedRectangle(cornerRadius: 8)
								.foregroundColor(Color(red: 0.17, green: 0.17, blue: 0.18, opacity: 1.0))	)
					Spacer()
					Button("Done") {
						feedData = FeedData(generalURL: URL(string: self.userData.feedURL)!)
					}.buttonStyle(BorderlessButtonStyle())
				}.padding(.horizontal, 4.0)
				
				ListView(feedData: feedData)

			}
			.listStyle(InsetListStyle())
			.navigationBarTitle((Text("News")), displayMode: .large)
			.padding(.horizontal, 3.0)
		}
		.preferredColorScheme(.dark)
		
		
		.preferredColorScheme(.dark)
		.pullToRefresh(isShowing: $isShowing) {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				FeedData.shared.refreshData(feed: FeedData.shared)
				self.isShowing = false
			}
		}
	}
	
	
}



struct NewsList_Previews: PreviewProvider {
	static var previews: some View {
		NewsList(userData: UserData(), feedData: FeedData())
		//.environmentObject(FeedData())
	}
}
