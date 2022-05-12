//
//  GetNextStep.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-12.
//
// () sqrt squared * / + - = constants(1, 0.5, etc) trig
// 1 Pass all blocks with x to left side


import Foundation

func firstStep(solvingFor: Int, leftSide: [[Int]], rightSide: [[Int]]) -> [[[Int]]] {
    var newLeftSide: [[Int]] = [[]]
    var newRightSide: [[Int]] = [[]]
    var allContainOnLeftSide = true
    var noneContainOnLeftSide = true
    for i in 0..<leftSide.count {
        var containsSolvingFor = false
        for j in 1..<leftSide[i].count {
            if leftSide[i][j] == solvingFor {
                containsSolvingFor = true
                break
            }
        }
        if containsSolvingFor {
            noneContainOnLeftSide = false
            newLeftSide.append(leftSide[i])
        }
        else {
            allContainOnLeftSide = false
            newRightSide.append(leftSide[i])
            newRightSide[newRightSide.count - 1][0] = 1 - newRightSide[newRightSide.count - 1][0]
        }
    }
    if noneContainOnLeftSide {
        return [rightSide, leftSide]
    }
    if allContainOnLeftSide {
        // Made the array contain 3 values to show that step one made no changes
        return [leftSide, rightSide, [[]]]
    }
    for i in 0..<rightSide.count {
        var containsSolvingFor = false
        for j in 1..<rightSide[i].count {
            if rightSide[i][j] == solvingFor {
                containsSolvingFor = true
                break
            }
        }
        if containsSolvingFor {
            newLeftSide.append(rightSide[i])
        }
        else {
            newLeftSide.append(rightSide[i])
            newLeftSide[newLeftSide.count - 1][0] = 1 - newLeftSide[newLeftSide.count - 1][0]
        }
    }
    return []
}
