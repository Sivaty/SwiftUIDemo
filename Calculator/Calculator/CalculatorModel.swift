//
//  CalculatorModel.swift
//  Calculator
//
//  Created by sengshuaibin on 2021/6/28.
//

import UIKit
import SwiftUI
import Combine

class CalculatorModel: ObservableObject {
    // 方式一
//    let objectWillChange = PassthroughSubject<Void, Never>()
//
//    var brain: CalculatorBrain = .left("0") {
//        willSet {
//            objectWillChange.send()
//        }
//    }
    
//    方式二
//    @Published var brain: CalculatorBrain = .left("0")
//
//    @Published var history: [CalculatorButtonItem] = []
    
    // 方式三
    var brain: CalculatorBrain = .left("0")
    var history: [CalculatorButtonItem] = []
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    func apply(_ item: CalculatorButtonItem) {
        Reducer.reduce(state: brain, action: item)
//        brain.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    var historyDetail: String {
        history.map { $0.description }.joined()
    }
    
    var temporaryKept: [CalculatorButtonItem] = []
    
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index.")
        let total = history + temporaryKept
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        brain = history.reduce(CalculatorBrain.left("0")) {
            result, item in
            result.apply(item: item)
        }
        objectWillChange.send()
    }
}
