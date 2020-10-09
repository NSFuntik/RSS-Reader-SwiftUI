//
//  SwiftUIView.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh


struct FeedsView: View {
	@ObservedObject var userData: UserData
	@State private var isShowing = false
	private let lightGreyColor = Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)

	//  https://www.banki.ru/xml/news.rss
	
	var body: some View {
		NavigationView {
			VStack {
				HStack {
					TextField("Enter URL", text: $userData.feedURL)
						.padding(.leading, 5.0)
						.padding(.all, 5.0)
						.font(.body)
						.foregroundColor(lightGreyColor)
						.background(
							RoundedRectangle(cornerRadius: 8)
								.foregroundColor(Color(
													red: 0.17,
													green: 0.17,
													blue: 0.18,
													opacity: 1.0))
						)
					Spacer()
					Button("Fetch") {
						userData.feeds = FeedData(generalURL: (URL(string: self.userData.feedURL) ?? URL(string: "https://www.banki.ru/xml/news.rss"))!)
						 
					}.buttonStyle(BorderlessButtonStyle())
				}.padding(.horizontal, 4.0)
		
				
				FeedListView(feedData: userData.feeds, feed: userData.feed)
			}
			.padding(.horizontal, 3.0)
			.listStyle(InsetListStyle())
			.navigationBarTitle((Text("News")), displayMode: .large)
		}
		.preferredColorScheme(.dark)
		.pullToRefresh(isShowing: $isShowing) {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				userData.feeds.refreshData(feed: userData.feeds)
				self.isShowing = false
			}
		}
	}
}

struct NewsList_Previews: PreviewProvider {
	static var previews: some View {
		FeedsView(userData: UserData())
	}
}
