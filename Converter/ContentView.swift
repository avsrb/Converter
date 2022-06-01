//
//  ContentView.swift
//  Converter
//
//  Created by Artem Serebriakov on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 10.0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "kilometers"
    
    let utils = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Amount to convert")
                }
                
                Section {
                    Picker("Convert from", selection: $inputUnit) {
                        ForEach(utils, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    Picker("Convert from", selection: $outputUnit) {
                        ForEach(utils, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Text("Result")
            }
            .navigationTitle("Converter")
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
