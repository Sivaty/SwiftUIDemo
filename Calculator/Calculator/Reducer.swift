//
//  Reducer.swift
//  Calculator
//
//  Created by STARY on 2023/1/7.
//

import Foundation

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem

struct Reducer {
    static func reduce(state: CalculatorState, action: CalculatorStateAction) -> CalculatorState {
        state.apply(item: action)
    }
}
