//
//  HistoryView.swift
//  Calculator
//
//  Created by sengshuaibin on 2021/6/28.
//

import SwiftUI

struct HistoryView: View {
    @Binding var editingHistory: Bool
    @ObservedObject var model: CalculatorModel
    
//    @Converter(initialValue: "100", from: "USD", to: "CNY", rate: 6.88)
//    var usd_cny
//    @Converter(initialValue: "100", from: "CNY", to: "EUR", rate: 0.13)
//    var cny_eur
    
    var body: some View {
        print("HistoryView")
           
        return VStack {
            Button("关闭") {
                editingHistory = false
            }
            
            // 1
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)")
                }
                // 2
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }
        }.padding()
    }
}
