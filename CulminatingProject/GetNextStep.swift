//
//  GetNextStep.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-12.
//
// () sqrt squared * / + - = constants(1, 0.5, etc) cos arccos maybe sin tan | |
// First Step Pass all blocks with x to left side
// Second Step Combine terms if possible by factoring. Remove terms equal to 0
// Third Step:
// If quadratic trinomial, use quadratic formula
//
// If linear, divide and get value
// Otherwise, reverse the functions

import Foundation

func passingTerms(solvingFor: Int, leftSide: [Int], rightSide: [Int]) -> [[Int]] {
    var newLeftSide: [Int] = []
    var newRightSide: [Int] = []
    var allContainOnLeftSide = true
    var noneContainOnRightSide = true
    var startOfTerm = 0
    for i in 0..<leftSide.count {
        var containsSolvingFor = false
        // is a +
        if leftSide[i] == 0 || leftSide[i] == 1 {
            if containsSolvingFor {
                if startOfTerm == 0 || leftSide[i - 1] == 0 {
                    if !newLeftSide.isEmpty {
                        newLeftSide.append(0)
                    }
                }
                else {
                        newLeftSide.append(1)
                }
                for j in startOfTerm..<i {
                    newRightSide.append(leftSide[j])
                }
            }
            else {
                allContainOnLeftSide = false
                if startOfTerm == 0 || leftSide[i - 1] == 0 {
                    newRightSide.append(1)
                }
                else {
                    if !newRightSide.isEmpty {
                        newRightSide.append(0)
                    }
                }
                for j in startOfTerm..<i {
                    newRightSide.append(leftSide[j])
                }
            }
            
        }
        if leftSide[i] == solvingFor {
            containsSolvingFor = true
        }
        
        if containsSolvingFor {
            newLeftSide.append(leftSide[i])
        }
        else {
            allContainOnLeftSide = false
            newRightSide.append(leftSide[i])
            newRightSide[newRightSide.count - 1][0] = 1 - newRightSide[newRightSide.count - 1][0]
        }
    }
    startOfTerm = 0
    for i in 0..<rightSide.count {
        var containsSolvingFor = false
        for j in 1..<rightSide[i].count {
            if rightSide[i][j] == solvingFor {
                containsSolvingFor = true
                break
            }
        }
        if containsSolvingFor {
            noneContainOnRightSide = false
            newLeftSide.append(rightSide[i])
        }
        else {
            newLeftSide.append(rightSide[i])
            newLeftSide[newLeftSide.count - 1][0] = 1 - newLeftSide[newLeftSide.count - 1][0]
        }
    }
    if allContainOnLeftSide && noneContainOnRightSide {
        // Made the array contain 3 values to show that step one made no changes
        return [leftSide, rightSide, [[]]]
    }
    return []
}

func isolatingVariable(solvingFor: Int, leftSide: [[Int]], rightSide: [[Int]]) -> [[[[Int]]]] {
    var leftSideList:[[[Int]]]
    if leftSide.count == 1 {
        
    }
    for i in 0..<leftSide.count {
        var containsSolvingFor = false
        for j in 1..<leftSide[i].count {
            if leftSide[i][j] == solvingFor {
                containsSolvingFor = true
                break
            }
        }
        if containsSolvingFor {
            newLeftSide.append(leftSide[i])
        }
        else {
            allContainOnLeftSide = false
            newRightSide.append(leftSide[i])
            newRightSide[newRightSide.count - 1][0] = 1 - newRightSide[newRightSide.count - 1][0]
        }
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
            noneContainOnRightSide = false
            newLeftSide.append(rightSide[i])
        }
        else {
            newLeftSide.append(rightSide[i])
            newLeftSide[newLeftSide.count - 1][0] = 1 - newLeftSide[newLeftSide.count - 1][0]
        }
    }
    if allContainOnLeftSide && noneContainOnRightSide {
        // Made the array contain 3 values to show that step one made no changes
        return [leftSide, rightSide, [[]]]
    }
    return []
}
