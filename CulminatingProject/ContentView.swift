//
//  ContentView.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-08.
//

import SwiftUI

struct ContentView: View {
    @State var input = ""
    func validInput(input: String) -> Bool {
        if let _ = Double(input) {
            return true
        }
        return false
    }
    func value(input: String) -> Double {
        if let value = Double(input) {
            return value
        }
        return 0
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle(isOn: .constant(true), label: {Text("Account for significant figures")})
            Text("Use 'e' or 'E' for scientific notation. \"1.2e3\", \"1.2E3\", and \"1200\" are all valid and equivalent inputs but \"1.2×10^3\" is not.")
            HStack {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                Text("Knowns:")
            }
            HStack {
                Text("Displacement =")
                TextField("Value", text: $input)
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
