//
//  ContentView.swift
//  Shared
//
//  Created by Derek Rhea on 2/17/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var totalSamples = "1025"
    @State var actualTotal = "0.0"
    @State var estimatedTotal = "0.0"
    @State var error = "0.0"
    @State var percentError = "0.0"
    let actualIntegral = 1.0 - exp(-1)
    @State var actualIntegralString = ""
    
    @ObservedObject var monteCarlo = MonteCarlo()
    @ObservedObject var errorLocal = ErrorCalculator()
    
    var body: some View {
        
        HStack {
            VStack {
                Text("Monte Carlo Integration")
                    .font(.title3)
                    .padding()
                VStack{
                    Text("n")
                    TextField("# Samples", text: $totalSamples)
                        .padding()
                }.padding()
                VStack{
                    Text("Total n")
                    TextField("# Samples", text: $monteCarlo.totalGuessesString)
                        .padding()
                }.padding()
                VStack{
                    Text("Estimate")
                    TextField("Estimated total",text:$monteCarlo.estimatedIntegral)
                        .padding()
                }.padding()
                VStack {
                    Text("Actual")
                    TextField("Actual total",text: $actualIntegralString)
                        .padding()
                }.padding()
                VStack {
                    Text("Error")
                    TextField("Total error",text:$errorLocal.errorDifferenceString)
                        .padding()
                }.padding()
                VStack {
                    Text("Percent Error")
                    TextField("% error",text: $errorLocal.percentErrorString)
                }.padding()
                
                Button("Cycle Calculation", action: {self.calculateButton()})
                    .padding()
                
                Button("Clear", action: {monteCarlo.clear()})
                    .padding(.bottom, 5.0)
                
            }
            VStack {
                drawingView(redLayer:$monteCarlo.insideData, blueLayer: $monteCarlo.outsideData)
                    .padding()
                    .aspectRatio(1, contentMode: .fit)
                    .drawingGroup()
                // Stop the window shrinking to zero.
                Spacer()
            }
        }
        
        
    }
    
    func calculateButton () {
        
        monteCarlo.calculateMonteCarloeToMinusX(XMax: 1.0, YMax: 1.0, XMin: 0.0, YMin: 0.0, iterations: Int(totalSamples)!)
        
        let estimate = Double(monteCarlo.estimatedIntegral)
        
        
        errorLocal.calculateError(insertedActual: actualIntegral, insertedEstimate: estimate!)
        
        
        actualIntegralString = String(actualIntegral)
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
