//
//  ContentView.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-08.
//
// Task
import SwiftUI

struct ContentView: View {
    @State var customSigFigs = false
    @State var numberSigFigs = 1
    @State var listOfKnowns = [Variable(typeOfVariable: 0, input: "", unit: 0)]
    @State var isNotUsed = [false, false, true, true, true]
    @State var solutionType = 1
    @State var solutionUnit = 0
    @State var aux = [0]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle(isOn: $customSigFigs, label: {Text("Custom Significant Figures")})
            Stepper(value: $numberSigFigs, in: 1...10, step: 1, label: {Text("Number of Significant Figures: \(numberSigFigs)")})
                .opacity(customSigFigs ? 1.0 : 0.0)
            Text("Use 'e' or 'E' for scientific notation. \"1.2e3\", \"1.2E3\", and \"1200\" are all valid and equivalent inputs but \"1.2×10^3\" and any other format is not.")
            HStack {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                    .opacity(listOfKnowns.count == types.count ? 0.0 : 1.0)
                    .onTapGesture {
                        let x = list(i: 0)
                        let y = isNotUsed[x[0]] ? x[0] : x[1]
                        listOfKnowns.append(Variable(typeOfVariable: y, input: "", unit: 0))
                        isNotUsed[y] = false
                        aux.append(y)
                    }
                Text("Knowns:")
            }
            ForEach(0..<listOfKnowns.count - 1, id: \.self) { i in
                HStack {
                    Picker("Type of known", selection: $listOfKnowns[i].typeOfVariable) {
                        ForEach(list(i: listOfKnowns[i].typeOfVariable), id: \.self) { j in
                            Text(types[j])
                        }
                    }
                    .onChange(of: listOfKnowns[i].typeOfVariable) { newValue in
                        isNotUsed[aux[i]] = true
                        isNotUsed[newValue] = false
                        aux[i] = newValue
                        listOfKnowns[i].unit = 0
                    }
                    TextField("Value", text: $listOfKnowns[i].input)
                    Picker("Units", selection: $listOfKnowns[i].unit) {
                        ForEach(0..<unitValues[listOfKnowns[i].typeOfVariable].count, id: \.self) { j in
                            Text(unitText[listOfKnowns[i].typeOfVariable][j])
                        }
                    }
                }
            }
            HStack {
                Text("Solve for:")
                Picker("Type of known", selection: $solutionType) {
                    ForEach(list(i: solutionType), id: \.self) { j in
                        Text(types[j])
                    }
                }
                .onChange(of: solutionType) { [solutionType] newValue in
                    isNotUsed[solutionType] = true
                    isNotUsed[newValue] = false
                    solutionUnit = 0
                }
                Text("in:")
                Picker("Units", selection: $solutionUnit) {
                    ForEach(0..<unitValues[solutionType].count, id: \.self) { j in
                        Text(unitText[solutionType][j])
                    }
                }
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
    func list(i: Int) -> [Int] {
        var list: [Int] = []
        for j in 0..<types.count {
            if isNotUsed[j] || i == j {
                list.append(j)
            }
        }
        return list
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
