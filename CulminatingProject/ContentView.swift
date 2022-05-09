//
//  ContentView.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle(isOn: .constant(true), label: {Text("Account for significant figures")})
            HStack {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                Text("Knowns:")
            }
            HStack {
                Text("Displacement:")
                Text("3.45")
                Text("m/s")
            }
            HStack {
                Text("Time:")
                Text("2.0")
                Text("s")
            }
            HStack {
                Text("Acceleration:")
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
