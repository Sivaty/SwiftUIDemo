//
//  LoginRequest.swift
//  PokeMaster
//
//  Created by 王 巍 on 2019/09/07.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation
import Combine

struct LoginRequest {
    let email: String
    let password: String

    var publisher: AnyPublisher<User, AppError> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                if self.password == "password" {
                    let user = User(email: self.email, favoritePokemonIDs: [])
                    promise(.success(user))
                } else {
                    promise(.failure(.passwordWrong))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}


struct EmailCheckingRequest {
    let email: String
    var publisher: AnyPublisher<Bool, Never> {
        Future<Bool, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                if self.email.lowercased() == "onevcat@gmail.com" {
                    promise(.success(false))
                } else {
                    promise(.success(true))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
