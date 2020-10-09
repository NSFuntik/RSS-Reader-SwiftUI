//
//  SourceRow.swift
//  SberTest
//
//  Created by Mikhailov on 09.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

struct SourceRow: View {
	@State private var url: String = ""
	//@ObservedObject var userData: FeedData
	private let lightGreyColor = Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)
    var body: some View {
		
		HStack {
			TextField("Enter source URL", text: $url)
				.padding(.leading, 5.0)
				.padding(.all, 5.0)
				.font(.body)
				.foregroundColor(lightGreyColor)
				.background(
					RoundedRectangle(cornerRadius: 8)
						.foregroundColor(Color(red: 0.17, green: 0.17, blue: 0.18, opacity: 1.0))	)
			Spacer()
			Button(action: {
				//FeedData(generalURL: URL(string: url)!)
			}, label: {
				Text("Done")
			})
			.buttonStyle(BorderlessButtonStyle())
		}.padding(.horizontal, 3.0)
		.preferredColorScheme(.dark)
    }
}

struct SourceRow_Previews: PreviewProvider {
    static var previews: some View {
		SourceRow()
			.previewLayout(.fixed(width: 400, height: 50))
	}
}
