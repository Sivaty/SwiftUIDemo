//
//  AppState.swift
//  PokeMaster
//
//  Created by sengshuaibin on 2021/7/7.
//  Copyright © 2021 OneV's Den. All rights reserved.
//

import Foundation

struct AppState {
    var settings = Settings()
}

extension AppState {
    // 2
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
            
            var text: String {
                switch self {
                case .id: return "ID"
                case .name: return "名字"
                case .color: return "颜色"
                case .favorite: return "最爱"
                }
            }
        }
        var showEnglishName = true
        var sorting = Sorting.id
        var showFavoriteOnly = false
        
        
        enum AccountBehavior: CaseIterable {
            case register, login
            
            var text: String {
                switch self {
                case .register: return "注册"
                case .login: return "登录"
                }
            }
        }
        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
        
        var loginUser: User?
    }
}
