//
//  ContentView.swift
//  Converter
//
//  Created by Artem Serebriakov on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 10.0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "meters"
    @FocusState private var inputIsFocused: Bool
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]

    private var result: String {
        let inputToMetersMultiplier: Double
        let metersToOutputeMultiplier: Double
        
        switch inputUnit {
        case "kilometers":
            inputToMetersMultiplier = 1000.0
        case "feet":
            inputToMetersMultiplier = 0.3048
        case "yards":
            inputToMetersMultiplier = 0.9144
        case "miles":
            inputToMetersMultiplier = 1609.34
        default:
            inputToMetersMultiplier = 1.0
        }
        
        switch outputUnit {
        case "kilometers":
            metersToOutputeMultiplier = 0.001
        case "feet":
            metersToOutputeMultiplier = 3.28084
        case "yards":
            metersToOutputeMultiplier = 1.09361
        case "miles":
            metersToOutputeMultiplier = 0.000621371
        default:
            metersToOutputeMultiplier  = 1.0
        }
        
        let inputInMeters = input * inputToMetersMultiplier
        let output = inputInMeters * metersToOutputeMultiplier
        
        let outputString  = output.formatted()
        return "\(outputString) \(outputUnit.lowercased())"
        
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Amount to convert")
                }
                
                Picker("Convert from", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Section{
                    Text(result)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done"){
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
