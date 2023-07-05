import SwiftUI
import MapKit
import CoreLocation
import UIKit
import Combine


public struct CustomMapView: UIViewRepresentable {
    let annotations: [MapViewAnnotation]
    let customLocations: [CustomLocation]
    init(customLocations: [CustomLocation], annotations: [MapViewAnnotation]) {
        self.customLocations = customLocations
        self .annotations = annotations
    }
    public func makeUIView(context:UIViewRepresentableContext<CustomMapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<CustomMapView>) {
       
        // Remove existing annotations
        uiView.removeAnnotations(uiView.annotations)
  
        // Add annotations for custom locations
        for location in customLocations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude ?? 0.0, longitude: location.longitude ?? 0.0)
            annotation.title = location.name
            uiView.addAnnotation(annotation);
        }
    }

}



// MARK: - Previews

//struct MapView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        let customLocations: [CustomLocation] = [
//            CustomLocation(name: "Location 1", latitude: 28.7041, longitude: 73.4194),
//             //  CustomLocation(name: "Location 2", latitude: 34.0522, longitude: -118.2437),
//               // Add more custom locations as needed
//           ]
//        CustomMapView(customLocations: customLocations);
//    }
//
//}

