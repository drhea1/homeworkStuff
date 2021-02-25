//
//  KochSnowflakeDetails.swift
//  FractalKochSnowflake
//
//  Created by Derek Rhea on 2/22/21.
//

import Foundation
import SwiftUI

class KochSnowflakeDetails: NSObject, ObservableObject {
    
    @Published var numberOfSides = 3.0
    @Published var sideLength = 1.0
    @Published var perimeter = 3.0
    
    
    func updateDetails(iteration: Int) {
        
        numberOfSides = 3.0 * Double(pow(4.0,Double(iteration)))
        sideLength = Double(pow((1.0/3.0),Double(iteration)))
        perimeter = 3.0 * Double(pow((4.0/3.0),Double(iteration)))
        
    }
    
    
}
