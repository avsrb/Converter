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
    @State private var outputUnit = "meters"
    
    private var outputNumber: Double {
        var result: Double
        var meters: Double
    
        // Convertion to meters. We storage value in meters
        switch outputUnit {
        case "kilometers":
            meters = inputNumber * 0.001
        case "miles":
            meters = inputNumber * 0.000621371
        case "feet":
            meters = inputNumber * 3.28084
        case "yards":
            meters = inputNumber * 1.0944
        default:
            meters = inputNumber * 1.0
        }
        
        switch inputUnit {
        case "kilometers":
            result = meters * 1000.0
        case "miles":
            result = meters * 1609.34
        case "feet":
            result = meters * 0.3048
        case "yards":
            result = meters * 0.9144
        default:
            result = meters * 1.0
        }
        return result
    }
    
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
                    Picker("Convert to", selection: $inputUnit) {
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
                
                Section{
                    Text(outputNumber.formatted())
                }
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
