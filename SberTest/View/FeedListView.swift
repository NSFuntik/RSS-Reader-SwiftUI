//
//  CircleImage.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct FeedListView: View {
	@ObservedObject var feedData: FeedData
	@State var feed: FeedDataObject
	var body: some View {
		return	List {
			ForEach(feedData.rssPosts) { feed in
				NavigationLink(destination: FeedDetailView(feed: feed),
							   isActive: $feedData.isRead)
				{
					VStack {
						HStack {
							FeedRow(feed: feed)
							Spacer()
							if feed.isRead == false {
								Image(systemName: "circle.fill")
									.imageScale(.small)
									.foregroundColor(.blue)
									.onTapGesture( perform: { feed.isRead = true } )
							}
							else {
								Image(systemName: "circle")
									.imageScale(.small)
									.foregroundColor(.gray)
							}
						}
					}
				}
			}
		}
	}
}

struct ListView_Previews: PreviewProvider {
	static var previews: some View {
		FeedListView(feedData: FeedData(), feed: UserData.shared.feed)
	}
}
