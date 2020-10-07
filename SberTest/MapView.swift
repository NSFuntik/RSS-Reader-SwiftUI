//
//  MapView.swift
//  SberTest
//
//  Created by Mikhailov on 06.10.2020.
//  Copyright © 2020 mikhailov. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
	
	func makeUIView(context: Context) -> MKMapView {
		MKMapView(frame: .zero)
	}
	func updateUIView(_ uiView: MKMapView, context: Context) {
		let coordinate = CLLocationCoordinate2D(
			latitude: 59.986087, longitude: 30.342614)
		let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)

	}
	
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView()
	}
}
