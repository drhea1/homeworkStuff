//
//  ContentView.swift
//  Shared
//
//  Created by Derek Rhea on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var numOfIterations: Int = 0
    @State var numOfIterationsString = "0"
    
    var body: some View {
        HStack {
            VStack {
                Text("Number of iterations")
                TextField("# iterations", text: $numOfIterationsString)
            }.padding()
            VStack {
                Text("Hello, world!")
                    .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
