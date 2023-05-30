//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/4/23.
//

import Combine

final class UserManager: ObservableObject {
    @Published var user = User()
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
