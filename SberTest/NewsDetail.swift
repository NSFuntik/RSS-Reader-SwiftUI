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
	@State var isRead = FeedData.shared.isRead

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
					if landmark.isRead == true {
						landmark.isRead = false }
					else if landmark.isRead == false
					{ landmark.isRead = true }
					//userData._isRead.toggle()
				}, label: {
					if landmark.isRead == true {
						Image(systemName: "circle.fill").foregroundColor(.blue)}
					else if landmark.isRead == false{
						Image(systemName: "circle").foregroundColor(.gray)
					}
				})
				Text(landmark.pubDate)
					.font(.caption)
					.fontWeight(.light)
					.foregroundColor(Color.black)
					.multilineTextAlignment(.center)
					.lineLimit(0)
					.padding(.all, 4.0)
			}
			
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




//struct NewsDetail_Previews: PreviewProvider {
//	static var previews: some View {
//		NewsDetail( userData: userData, landmark: userData.RssPosts[1])
//			.environmentObject(FeedData())
//	}
//}
