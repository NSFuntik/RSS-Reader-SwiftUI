//
//  NewsStart.swift
//  SberTest
//
//  Created by Mikhailov on 07.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//
import SwiftUI

struct NewFeedPopup: View {
	@Binding var feedURL: String
	var addFeedPressed: (() -> Void)
	@State var show: Bool
	
	var body: some View {
		VStack {
			ZStack {
				Text("Feed URL")
					.font(.title)
					.foregroundColor(.gray)
			}
			
			TextField("URL", text: $feedURL)
				.background(Color.white)
				.foregroundColor(Color(.black))
				.clipShape(RoundedRectangle(cornerRadius: 5))
				.keyboardType(.URL)
				.textContentType(.URL)
				.padding()
			
			Button(action: addFeedPressed) {
				Text("Add feed")
					.padding()
					.foregroundColor(.gray)
					.background(Color.white)
					.clipShape(RoundedRectangle(cornerRadius: 10))
			}
			
			
			Spacer()
		}
		.frame(maxWidth: .infinity)
		.frame(height: show ? nil : 0)
		.clipShape(RoundedRectangle(cornerRadius: 8))
		.opacity(show ? 1 : 0)
		.animation(Animation.easeIn(duration: 0.1))
		.animation(Animation.easeIn(duration: 0.5))
	}
}

//struct NewFeedPopup_Previews: PreviewProvider {
//	static var previews: some View {
//		NewFeedPopup(type: type, feedURL: .constant("https://www.google.com"), addFeedPressed: {},
//					 feedAddColor: .constant(Color.backgroundNeo), attempts: .constant(1), show: .constant(true))
//			.frame(maxHeight: 100)
//	}
//}

struct NewFeedPopup_Previews: PreviewProvider {
	static var previews: some View {
		NewFeedPopup(feedURL: .constant("https://www.google.com"), addFeedPressed: {}, show: true)
			.frame(maxHeight: 100)
	}
}
