//
//  DesignCodeApp.swift
//  DesignCode
//
//  Created by Link on 2022/7/23.
//

import SwiftUI

@main
struct DesignCodeApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
