//
//  ErrorCalculator.swift
//  Monte-Carlo-Rhea
//
//  Created by Derek Rhea on 2/19/21.
//

import Foundation
import SwiftUI

class ErrorCalculator: NSObject, ObservableObject {

    @Published var actual: Double = 0.0
    @Published var estimate: Double = 0.0
    @Published var errorDifference: Double = 0.0
    @Published var absoluteErrorDifference: Double = 0.0
    @Published var percentError: Double = 0.0
    @Published var percentErrorString = "0.0"
    @Published var absoluteErrorDifferenceString = "0.0"
    @Published var errorDifferenceString = "0.0"
    
    
    
    func calculateError(insertedActual: Double,insertedEstimate: Double) {
        
        actual = insertedActual
        estimate = insertedEstimate
        
        errorDifference = actual - estimate
        
        absoluteErrorDifference = abs(actual-estimate)
        
        percentError = (abs(actual-estimate)/actual) * 100.0
        
        percentErrorString = String(percentError)
        
        absoluteErrorDifferenceString = String(absoluteErrorDifference)
        
        errorDifferenceString = String(errorDifference)
        
        
    }

    
    
    
    
    
}


