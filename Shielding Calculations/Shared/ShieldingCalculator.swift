//
//  ShieldingCalculator.swift
//  Shielding Calculations
//
//  Created by Derek Rhea on 2/22/21.
//

import Foundation
import SwiftUI

class ShieldingCalculator: NSObject, ObservableObject {
    
    @ObservedObject var energyLoss = EnergyLossCalculator()
    @Published var boxHeight = 10.0
    @Published var boxWidth = 5.0
    @Published var distanceTraveled = 1.0
    @Published var startHeight = 5.0
    @Published var percentEnergyLost = 1.0
    @Published var numberOfParticles = 1
    @Published var numberEscaped = 0
    @Published var percentEscaped = 0.0
    
    @Published var boxHeightString = "10.0"
    @Published var boxWidthString = "5.0"
    @Published var distanceTraveledString = "1.0"
    @Published var startHeightString = "5.0"
    @Published var percentEnergyLostString = "1.0"
    @Published var numberOfParticlesString = "1"
    @Published var numberEscapedString = "0"
    @Published var percentEscapedString = "0.0"
    @Published var numberOfMovementsString = "0"
    
    @Published var finalPositionEachParticle = [(xPoint: Double, yPoint: Double)]()
        
    
    func calculateArrayOfPoints(percentLossInput: Double, numberParticlesInput: Int) {
        
        percentEnergyLost = percentLossInput
        percentEnergyLostString = String(percentEnergyLost)
        numberOfParticles = numberParticlesInput
        numberOfParticlesString = String(numberOfParticles)
        
        let numberOfMovements = energyLoss.lossCalculator(energyLossInput: percentEnergyLost)
        
        numberOfMovementsString = String(numberOfMovements)
        
        var point = (xPoint: 0.0, yPoint: 0.0)
        var tempData : [(xPoint: Double, yPoint: Double)] = []
        
        
        
        for _ in 1...numberOfParticles {
            
            point.xPoint = distanceTraveled
            point.yPoint = startHeight
            var xArray = [distanceTraveled]
            var yArray = [startHeight]
            
            for k in 1...numberOfMovements {
                
                let randomTheta = Double.random(in: 0.0..<(2.0*Double.pi))
                
                let position = k-1
                
                let xNew = distanceTraveled*cos(randomTheta) + xArray[position]
                let yNew = distanceTraveled*sin(randomTheta) + yArray[position]
                
                xArray.append(xNew)
                yArray.append(yNew)
                
                point.xPoint = xNew
                point.yPoint = yNew
                
                if xArray[k] < 0.0 {
                    break
                } else if xArray[k] > boxWidth || yArray[k] < 0.0 || yArray[k] > boxHeight {
                    numberEscaped += 1
                    numberEscapedString = String(numberEscaped)
                    break
                }
            }
            
            tempData.append(point)
        }
        
        finalPositionEachParticle.append(contentsOf: tempData)
        
        
        if numberEscaped > 0 {
            percentEscaped = Double(numberEscaped)/Double(numberOfParticles) * 100.0
            percentEscapedString = String(percentEscaped)
        }
        
    }
    
}
