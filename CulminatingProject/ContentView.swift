//
//  ContentView.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-08.
//

import SwiftUI

struct ContentView: View {
    @State var customSigFigs = false
    @State var numberSigFigs = 1
    @State var listOfKnowns: [Variable] = [Variable(typeOfVariable: 1, input: "", unit: 0)]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle(isOn: $customSigFigs, label: {Text("Custom Significant Figures")})
            Stepper(value: $numberSigFigs, in: 1...10, step: 1, label: {Text("Number of Significant Figures: \(numberSigFigs)")})
                .opacity(customSigFigs ? 1.0 : 0.0)
            Text("Use 'e' or 'E' for scientific notation. \"1.2e3\", \"1.2E3\", and \"1200\" are all valid and equivalent inputs but \"1.2×10^3\" and any other format is not.")
            HStack {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                Text("Knowns:")
            }
            HStack {
                Picker("Type of known", selection: $listOfKnowns[0].typeOfVariable) {
                    ForEach(0..<types.count, id: \.self) { i in
                        Text(types[i]).tag(i)
                    }
                }
                TextField("Value", text: $listOfKnowns[0].input)
                Text("m/s")
            }
            HStack {
                Text("Time =")
                Text("2.0")
                Text("s")
            }
            HStack {
                Text("Acceleration =")
                Text("-9.80")
                Text("m/s2")
            }
            HStack {
                Text("Solve for:")
                Text("Initial Velocity")
                Text("in")
                Text("m/s")
            }
            HStack {
                Spacer()
                Button("Show Solution") {
                    
                }
                .buttonStyle(.bordered)
                .cornerRadius(20)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
