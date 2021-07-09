//
//  AppError.swift
//  PokeMaster
//
//  Created by sengshuaibin on 2021/7/7.
//  Copyright © 2021 OneV's Den. All rights reserved.
//

import Foundation

enum AppError: Error, Identifiable {
    // 2
    var id: String { localizedDescription }
    case passwordWrong
}

// 3
extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .passwordWrong: return "密码错误"
        }
    }
}
