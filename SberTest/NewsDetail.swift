//
//  NewsDetail.swift
//  SberTest
//
//  Created by Mikhailov on 07.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct NewsDetail: View {
	@ObservedObject var userData: FeedData
	var landmark: FeedDataObject
	var landmarkIndex: Int {
		userData.RssPosts.firstIndex(where: { $0.id == landmark.id }) ?? 0
	}
	
	var body: some View {
		VStack(alignment: .center) {
			Text(landmark.title)
				.font(.title)
				.fontWeight(.light)
				.foregroundColor(Color.yellow)
				.multilineTextAlignment(.center)
				.lineLimit(5)
				.padding(.horizontal, 3.0)
				.offset(y: -50)
			HStack(alignment: .top, spacing: 2.0) {
				Button(action: {
					self.userData.RssPosts[self.landmarkIndex].isRead.toggle()
				}) {
					if self.userData.RssPosts[self.landmarkIndex].isRead {
						Image(systemName: "circle")
							.imageScale(.large)
							.foregroundColor(Color.gray)
							.scaleEffect()
					} else {
						Image(systemName: "circle.fill")
							.imageScale(.large)
							.foregroundColor(Color.blue)
					}
				}
				Spacer()
				Text(landmark.pubDate)
					.font(.caption)
					.fontWeight(.light)
					.foregroundColor(Color.black)
					.multilineTextAlignment(.center)
					.lineLimit(0)
					.padding(.all, 4.0)
			}
			.padding(.horizontal)
			.offset(y: -30)

			ScrollView {
				Text(landmark.description)
					.fontWeight(.thin)
					.multilineTextAlignment(.leading)
					.lineLimit(nil)
					.padding(.horizontal)
			}.frame(maxWidth: .infinity)
		}
		//.navigationBarTitle(Text(String(landmarkIndex)))
		
	}
}


struct NewsDetail_Previews: PreviewProvider {
	static var previews: some View {
		NewsDetail( userData: FeedData.shared, landmark: FeedData.shared.RssPosts[1])
			.environmentObject(FeedData())
	}
}
