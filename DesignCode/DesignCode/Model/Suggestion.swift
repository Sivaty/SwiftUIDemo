//
//  Suggestion.swift
//  DesignCode
//
//  Created by Link on 2022/8/28.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design"),
]
