//
//  ContentView.swift
//  Calculator
//
//  Created by sengshuaibin on 2021/6/27.
//

import SwiftUI

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 375
//    @ObservedObject var model = CalculatorModel()
    @EnvironmentObject var model: CalculatorModel
    @State private var editingHistory = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作历史：\(model.history.count)") {
                editingHistory = true
            }.sheet(isPresented: $editingHistory, content: {
                HistoryView(model: model)
            })
            Text(model.brain.output)
                .font(.system(size: 76))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding(.trailing, 24)
//            CalculatorButtonPad(model: model)
            CalculatorButtonPad()
                .padding(.bottom)
        }
        .scaleEffect(scale)
        
        
//        VStack(spacing: 12) {
//
//            HStack {
//                Spacer()
//                Text("0")
//                    .font(.system(size: 76))
//                    .minimumScaleFactor(0.5)
//                    .lineLimit(1)
//                    .padding(.trailing, 24)
//                    .foregroundColor(Color("number"))
//            }
//            CalculatorButtonPad()
//                .padding(.bottom)
//        }
//        .frame(minHeight: 0, maxHeight: .infinity, alignment: .bottom)
//        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(CalculatorModel())
//            ContentView()
//                .preferredColorScheme(.dark)
//        ContentView().previewDevice("iPhone SE (2nd generation)")
        }
    }
}

struct CalculatorButton: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 375
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let foregroundColor: Color
    let action: () -> Void
    
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(foregroundColor)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)

        })
//        .scaleEffect(scale)
        
//        ZStack {
//            RoundedRectangle(cornerRadius: size.width / 2)
//                .frame(width: size.width, height: size.height)
//                .foregroundColor(Color(backgroundColorName))
//            Button(action: action, label: {
//                Text(title)
//                    .font(.system(size: fontSize))
//                    .foregroundColor(foregroundColor)
//            })
//        }
    }
}

struct CalculatorButtonRow: View {
//    @Binding var brain: CalculatorBrain
//    var model: CalculatorModel
    @EnvironmentObject var model: CalculatorModel
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName, foregroundColor: item.foregroundColor)
                {
                    model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
//    @Binding var brain: CalculatorBrain
//    var model: CalculatorModel
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
//                CalculatorButtonRow(model: model, row: row)
                CalculatorButtonRow(row: row)
            }
        }
    }
}
