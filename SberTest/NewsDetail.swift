//
//  NewsDetail.swift
//  SberTest
//
//  Created by Mikhailov on 07.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct NewsDetail: View {
	@EnvironmentObject var userData: UserData
	var landmark: News
	var landmarkIndex: Int {
		userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
	}

	
	var body: some View {
		VStack(alignment: .center) {
			Text(landmark.title)
				.font(.title)
				.fontWeight(.light)
				.foregroundColor(Color.yellow)
				.multilineTextAlignment(.center)
				.lineLimit(4)
				.padding(.horizontal, 3.0)
			HStack {
				
				Button(action: {
					self.userData.landmarks[self.landmarkIndex].isRead.toggle()
				}) {
					if self.userData.landmarks[self.landmarkIndex].isRead {
						Image(systemName: "circle")
							.imageScale(.large)
							.foregroundColor(Color.gray)
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


			ScrollView {
				Text(landmark.description)
					.fontWeight(.thin)
					.multilineTextAlignment(.leading)
					.lineLimit(nil)
					.padding(.horizontal)
			}.frame(maxWidth: .infinity)
		}
		.navigationBarTitle(Text(String(landmarkIndex)).italic(), displayMode: .inline)
		
	}
}


struct NewsDetail_Previews: PreviewProvider {
	static var previews: some View {
		NewsDetail(landmark: landmarkData[3])
			.environmentObject(UserData())
	}
}
