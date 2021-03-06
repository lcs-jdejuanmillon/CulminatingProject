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
    @State var showButton: Bool {
        if listOfKnowns.count < 3 {
            return false
        }
        for i in 0..<listOfKnowns.count {
            if !listOfKnowns[i].validInput || (!isVector[listOfKnowns[i].typeOfVariable] && listOfKnowns[i].value <= 0) {
                return false
            }
        }
        return true
    }
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $customSigFigs, label: {Text("Custom Significant Figures")})
            Stepper(value: $numberSigFigs, in: 1...10, step: 1, label: {Text("Number of Significant Figures: \(numberSigFigs)")})
                .opacity(customSigFigs ? 1.0 : 0.0)
            Text("Use 'e' or 'E' for scientific notation. \"1.2e3\", \"1.2E3\", and \"1200\" are all valid and equivalent inputs but \"1.2×10^3\" and any other format is not.")
            HStack {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                    .opacity(listOfKnowns.count == types.count - 1 ? 0.0 : 1.0)
                    .onTapGesture {
                        let x = list(i: 0)
                        let y = isNotUsed[x[0]] ? x[0] : x[1]
                        listOfKnowns.append(Variable(typeOfVariable: y, input: "", unit: 0))
                        isNotUsed[y] = false
                        aux.append(y)
                    }
                Text("Knowns:")
            }
            ForEach(0..<listOfKnowns.count, id: \.self) { i in
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
                ZStack {
                    Text("* Give a valid numeric value for the \(types[listOfKnowns[i].typeOfVariable])")
                        .opacity(listOfKnowns[i].validInput ? 0.0 : 1.0)
                    Text("* \(types[listOfKnowns[i].typeOfVariable]) has to be positive")
                        .opacity(isVector[listOfKnowns[i].typeOfVariable] || !listOfKnowns[i].validInput || listOfKnowns[i].value > 0 ? 0.0 : 1.0)
                }
                .foregroundColor(.red)
                .font(.caption2)
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
                NavigationLink(destination: SolutionView()) {
                    Button("Show Solution") {
                        
                    }
                    .buttonStyle(.bordered)
                    .cornerRadius(20)
                }
                Spacer()
            }
            .opacity(showButton ? 1.0 : 0.0)
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
    func getSigFigs() -> Int {
        if customSigFigs {
            return numberSigFigs
        }
        var sigFigs = 10
        for i in 0..<listOfKnowns.count {
            sigFigs = min(sigFigs, listOfKnowns[i].sigFigs)
        }
        return sigFigs
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
