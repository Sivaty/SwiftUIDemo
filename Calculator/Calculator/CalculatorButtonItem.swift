//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by sengshuaibin on 2021/6/27.
//

import SwiftUI

enum CalculatorButtonItem: Hashable {
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}


extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    
    var size: CGSize {
        let width: CGFloat = 80
        
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: width * 2 + 8, height: width)
        }
        return CGSize(width: width, height: width)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot: return "digitBackground"
        case .op: return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .command: return Color("commandText")
        default: return Color.white
        }
    }
    
}
