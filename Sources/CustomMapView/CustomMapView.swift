import SwiftUI
import MapKit
import CoreLocation
import UIKit


public struct CustomMapView: UIViewRepresentable {
    
    var customLocations: [CustomLocation]
     init(customLocations: [CustomLocation]) {
        self.customLocations = customLocations
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
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            annotation.title = location.name
            uiView.addAnnotation(annotation);
        }
    }

}


public struct CustomLocation: Identifiable {
    public let id = UUID()
    public let name: String
    public let latitude: Double
    public let longitude: Double
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

