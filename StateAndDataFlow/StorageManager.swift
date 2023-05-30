//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/4/23.
//

import Foundation
import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data())
        else {
            return User()
        }
        return user
    }
    
    func clear(userManager: UserManager) {
        userData = nil
        userManager.user.name = ""
        userManager.user.isRegistered = false
    }
}
