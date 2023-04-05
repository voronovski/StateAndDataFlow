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
        if let name = defaults.string(forKey: nameKey) {
            return name
        }
        return ""
    }
    
    func fetchIsRegister() -> Bool {
        if let _ = defaults.string(forKey: nameKey) {
            return true
        }
        return false
    }
    
    func deleteName(name: String) {
        defaults.set("", forKey: nameKey)
        defaults.set(false, forKey: isRegisterKey)
    }
}
