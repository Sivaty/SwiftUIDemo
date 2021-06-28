//
//  CalculatorApp.swift
//  Calculator
//
//  Created by sengshuaibin on 2021/6/27.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CalculatorModel())
        }
    }
}
