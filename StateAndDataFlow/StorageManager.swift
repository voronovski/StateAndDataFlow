//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/4/23.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    private let nameKey = "name"
    private let isRegisterKey = "isRegister"
    
    private init() {}
    
    func save(name: String) {
        defaults.set(name, forKey: nameKey)
        defaults.set(true, forKey: isRegisterKey)
    }
    
    func fetchName() -> String {
        defaults.string(forKey: nameKey) ?? ""
    }
    
    func fetchIsRegister() -> Bool {
        defaults.string(forKey: nameKey) != ""
    }
    
    func deleteName(name: String) {
        defaults.set("", forKey: nameKey)
        defaults.set(false, forKey: isRegisterKey)
    }
}
