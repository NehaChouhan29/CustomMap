//
//  SwiftUIView.swift
//  
//
//  Created by Neha Chouhan on 05/07/23.
//

import SwiftUI
import Foundation
import MapKit

public protocol CustomLocation: MKAnnotation {
    
    
    /**
     The id to display  in the annotation's view.
     */
    var id: UUID? {
        get
    }
    
    /**
     The name to display  in the annotation's view.
     */
    var name: String? {
        get
    }
    
    /**
      latituder of the annotations's view.
     */
    var latitude: Double? {
        get
    }
    /**
     longitude of the annotations's view.
     */
    var longitude: Double? {
        get
    }
}

