//
//  EnergyLossCalculator.swift
//  Shielding Calculations
//
//  Created by Derek Rhea on 2/22/21./Users/derekrhea/Desktop/Shielding Calculations/Shared/ContentView.swift
//

import Foundation
import SwiftUI

// Object that determines number of steps until a particle loses energy


class EnergyLossCalculator: NSObject, ObservableObject {
    
    @Published var numberOfMovements: Int = 0
    @Published var energyLoss: Double = 0.0
    
    // Sets value and returns number of movements before stopping
    
    func lossCalculator(energyLossInput: Double) -> Int{
        
        energyLoss = energyLossInput
        var energyLossTotal = energyLoss
        var n = 0
        
        while energyLossTotal <= 100.0 {
            energyLossTotal += energyLoss
            n += 1
        }
        
        numberOfMovements = n
        
        return numberOfMovements
    }
    
    
    
}
