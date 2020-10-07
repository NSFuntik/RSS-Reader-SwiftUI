//
//  NewsRow.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
	@EnvironmentObject var userData: UserData
	var landmark: News
	var landmarkIndex: Int {
		userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
	}
	
	var body: some View {
		VStack(alignment: .leading) {
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
				Spacer()
				Text(landmark.pubDate)
				.font(.footnote)
				.multilineTextAlignment(.trailing)
				//.padding(.trailing, 2.0)
		}
			Text(landmark.title)
				.fontWeight(.semibold)
				.lineLimit(4)
				.font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
				.padding(.leading, 3.0)
		}
		.padding(.all, 5.0)
		
	}
}


struct NewsRow_Previews: PreviewProvider {
	static var previews: some View {
			NewsRow(landmark: landmarkData[1])
	}
}
