//
//  Users.swift
//  DesignCode
//
//  Created by Link on 2022/10/12.
//

import SwiftUI

struct Users: Identifiable, Decodable {
    var id: Int
    var username: String
    var avatar: String
    var email: String
    
}

class UserModel: ObservableObject {
    @Published var users: [Users] = []
    
    func fetchUsers() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/v2/users?size=10")!
            let (data, _) = try await URLSession.shared.data(from: url)
            users = try JSONDecoder().decode([Users].self, from: data)
        } catch  {
            users = []
        }
        
    }
}
