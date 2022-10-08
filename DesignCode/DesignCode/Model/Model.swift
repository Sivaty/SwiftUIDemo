//
//  Model.swift
//  DesignCode
//
//  Created by Link on 2022/8/6.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectModal: Modal = .signIn
    
}

enum Modal: String {
    case signUp
    case signIn
    
}
