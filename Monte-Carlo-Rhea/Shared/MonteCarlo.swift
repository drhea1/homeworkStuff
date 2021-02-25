//
//  MonteCarlo.swift
//  Monte-Carlo-Rhea
//
//  Created by Derek Rhea on 2/17/21.
//

import Foundation
import SwiftUI

class MonteCarlo: NSObject, ObservableObject {
 
    @Published var insideData = [(xPoint: Double, yPoint: Double)]()
    @Published var outsideData = [(xPoint: Double, yPoint: Double)]()
    @Published var totalGuessesString = "0.0"
    @Published var guessesString = "0.0"
    @Published var estimatedIntegral = "0.0"
    @Published var boundingBox = Ellipsoid()
    @Published var pointsInRadius: Int = 0
    
    func calculateMonteCarloeToMinusX(XMax: Double, YMax: Double, XMin: Double, YMin: Double,iterations: Int) {
        
        var totalGuesses = Double(totalGuessesString)!
        totalGuesses += Double(iterations)
        totalGuessesString = String(totalGuesses)
        
        
        var point = (xPoint: 0.0, yPoint: 0.0)
        var tempInsideData : [(xPoint: Double, yPoint: Double)] = []
        var tempOutsideData : [(xPoint: Double, yPoint: Double)] = []
        
        
        
        
        for _ in (1...iterations) {
            
            point.xPoint = Double.random(in: XMin...XMax)
            point.yPoint = Double.random(in: YMin...YMax)
            
            let yActual = exp(-point.xPoint)
            
            if point.yPoint > yActual {
                
                tempOutsideData.append(point)
                
            } else {
                
                pointsInRadius += 1
                tempInsideData.append(point)
        
            }
            
            
            
        }
        
        insideData.append(contentsOf: tempInsideData)
        outsideData.append(contentsOf: tempOutsideData)
        
        
        let areaOfBox = (XMax - XMin) * (YMax - YMin)
        
        let integral = Double(pointsInRadius)/totalGuesses * areaOfBox
        
        
        estimatedIntegral = String(integral)
        
        
    }
    
    
    func clear(){
        
        totalGuessesString = "0.0"
        guessesString = "0.0"
        insideData = []
        outsideData = []
        estimatedIntegral = "0.0"
        pointsInRadius = 0
        
        
    }
    
    
    
}
