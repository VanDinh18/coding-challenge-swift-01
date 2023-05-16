//
//  AppData.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 16/05/2023.
//

import Foundation

@propertyWrapper
struct Storage<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

//private struct Constants {
//    static let isPremiumKey = "is_premium_key"
//    static let usernameKey = "username_key"
//}

struct User: Codable {
    var useraname: String
    var isPremium: Bool
}

struct AppData {
    @Storage(key: "user_key", defaultValue: User(useraname: "", isPremium: false))
    static var user: User
    
    @Storage(key: "token_key", defaultValue: "")
    static var accessToken: String
}
