//
//  NewsDetail.swift
//  SberTest
//
//  Created by Mikhailov on 07.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct FeedDetailView: View {
	@State var feed: FeedDataObject
	
	var body: some View {
		VStack(alignment: .center) {
			Text(feed.title)
				.font(.title)
				.fontWeight(.light)
				.foregroundColor(Color.yellow)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 3.0)
				.offset(y: -30)
			
			HStack(alignment: .top, spacing: 2.0) {
				Text(feed.pubDate)
					.font(.caption)
					.fontWeight(.light)
					.foregroundColor(Color.gray)
					.multilineTextAlignment(.center)
					.lineLimit(0)
			}
		}
		.padding(.horizontal)
		
		ScrollView {
			Text(feed.description)
				.fontWeight(.thin)
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.padding(.horizontal)
				.foregroundColor(Color.gray)
		}.frame(maxWidth: .infinity)
	}
}
