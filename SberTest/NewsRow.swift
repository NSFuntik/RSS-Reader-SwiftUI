//
//  NewsRow.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
	@ObservedObject var userData: FeedData
	var landmark: FeedDataObject
	var landmarkIndex: Int {
		userData.RssPosts.firstIndex(where: { $0.id == landmark.id })!
	}
	
	var body: some View {
			HStack {
				if landmark.isRead {
					Image(systemName: "\(landmarkIndex).circle")
						.imageScale(.small)
						.foregroundColor(.gray)
				} else {
					Image(systemName: "\(landmarkIndex).circle.fill")
						.imageScale(.large)
						.foregroundColor(.blue)
				}
				VStack() {
					Text(landmark.title)
						.fontWeight(.bold)
						.lineLimit(4)
						.font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
						.padding(.horizontal, 3.0)
					HStack {
						//Spacer()
						Text(landmark.pubDate)
							.font(.caption)
							.fontWeight(.light)
							.multilineTextAlignment(.trailing)
							.padding(.leading, 10.0)
					}
				}
				
				//.padding(.trailing, 2.0)
		}

		}
		//.padding(.all, 5.0)
}


struct NewsRow_Previews: PreviewProvider {
	static var previews: some View {
		NewsRow(userData: FeedData.shared, landmark: FeedData.shared.RssPosts[0])
	}
}
