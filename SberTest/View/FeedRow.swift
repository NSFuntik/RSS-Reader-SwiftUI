//
//  NewsRow.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct FeedRow: View {
	@State var feed: FeedDataObject
	
	var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			Text(feed.title)
				.fontWeight(.bold)
				.lineLimit(4)
				.font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
				.padding(.horizontal, 3.0)
				
			Text(feed.pubDate)
				.font(.caption)
				.fontWeight(.light)
				.multilineTextAlignment(.trailing)
				.lineLimit(2)
				.padding(.leading, 130.0)
		}
	}
}
