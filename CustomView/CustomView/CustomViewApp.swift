//
//  CustomViewApp.swift
//  CustomView
//
//  Created by sengshuaibin on 2021/6/25.
//

import SwiftUI

@main
struct CustomViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
