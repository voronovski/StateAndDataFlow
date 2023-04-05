//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/4/23.
//

import Foundation

class UserManager: ObservableObject {
    var name = StorageManager.shared.fetchName()
    @Published var isRegister = StorageManager.shared.fetchIsRegister()
}
