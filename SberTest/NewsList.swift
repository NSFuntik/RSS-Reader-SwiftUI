//
//  SwiftUIView.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI

//let landmarkData: [News] = XMLParserService.shared.itemStore!
//var newsData: [News] = []


struct NewsList: View {
	@EnvironmentObject var userData: UserData

	var body: some View {
		NavigationView {
				List {
					ForEach(userData.landmarks) { item in //<-
						NavigationLink(destination: NewsDetail(landmark: item)) {
							NewsRow(landmark: item)
							
						}
					}
					//.padding()
				}
					.navigationBarTitle((Text("News")), displayMode: .large)
		}

	}
}

//func loadData() {
//	XMLParserService.shared.parseData { (news) in
		
//		newsData = (news)
		//newsData.append(contentsOf: news)
		//self.cellStates = Array(repeating: .collapsed, count: news.count)
		//		OperationQueue.main.addOperation {
		//			self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
		//		}
		//		dump(newsData.description)
//	}
//}

struct SwiftUIView_Previews: PreviewProvider {
	static var previews: some View {
		NewsList()
		.environmentObject(UserData())
	}
}
