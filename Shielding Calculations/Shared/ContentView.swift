//
//  ContentView.swift
//  Shared
//
//  Created by Derek Rhea on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var energyLoss: Double = 51.0
    @State var numberOfParticles: Int = 1
    @State var numberEscaped: Int = 0
    @State var percentEscaped: Double = 0.0
    @State var energyLossString =  "51.0"
    @State var numberOfParticlesString = "1"
    @State var numberEscapedString = "0"
    @State var percentEscapedString = "0.0"
    
    @ObservedObject var shielding = ShieldingCalculator()
    
    var body: some View {
        HStack {
            VStack {
                VStack {
                    Text("Shielding Calculator")
                        .padding()
                        .font(.largeTitle)
                }.padding()
                VStack {
                    Text("Energy Loss")
                    TextField("% energy loss", text: $energyLossString)
                }.padding()
                VStack {
                    Text("Number of Particles")
                    TextField("# of particles", text: $numberOfParticlesString)
                }.padding()
                VStack {
                    HStack {
                        Button("Calculate", action: {self.calculateButton()})
                        Button("Clear/Reset", action: {self.clearButton()})
                    }.padding()
                }.padding()
                VStack {
                    Text("Number of Particles Escaped")
                    TextField("# escaped", text: $shielding.numberEscapedString)
                }.padding()
                VStack {
                    Text("Percent Escaped")
                    TextField("% escaped", text: $shielding.percentEscapedString)
                }.padding()
                VStack {
                    Text("Number of Movements")
                    TextField("# movements", text: $shielding.numberOfMovementsString)
                }.padding()
            }
            
            VStack {
                drawingView(redLayer: $shielding.finalPositionEachParticle)
                    .padding()
                    .aspectRatio(1, contentMode: .fit)
                    .drawingGroup()
            }
        }
    }
    
    
    
    func calculateButton() {
        
        self.clearButton()
        
        energyLoss = Double(energyLossString)!
        numberOfParticles = Int(numberOfParticlesString)!
        
        shielding.calculateArrayOfPoints(percentLossInput: energyLoss, numberParticlesInput: numberOfParticles)
    }
    
    func clearButton() {
        
        shielding.boxHeight = 10.0
        shielding.boxWidth = 5.0
        shielding.distanceTraveled = 1.0
        shielding.startHeight = 5.0
        shielding.percentEnergyLost = 1.0
        shielding.numberOfParticles = 1
        shielding.numberEscaped = 0
        shielding.percentEscaped = 0.0
        
        shielding.boxHeightString = "10.0"
        shielding.boxWidthString = "5.0"
        shielding.distanceTraveledString = "1.0"
        shielding.startHeightString = "5.0"
        shielding.percentEnergyLostString = "1.0"
        shielding.numberOfParticlesString = "1"
        shielding.numberEscapedString = "0"
        shielding.percentEscapedString = "0.0"
        shielding.numberOfMovementsString = "0"
        
        shielding.finalPositionEachParticle = []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
