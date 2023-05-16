//
//  AuthModel.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 16/05/2023.
//

import Foundation

enum UserStateError: Error {
    case signInError, signOutError
}

@MainActor
class AuthModel: ObservableObject {
    @Published var isLoggedIn = !AppData.accessToken.isEmpty
    @Published var isBusy = false
    
    func signIn(email: String, password: String)async -> Result<Bool, UserStateError> {
        isBusy = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            AppData.user = User(useraname: "Nguyen Van A", isPremium: true)
            AppData.accessToken = "Bear token"
            isLoggedIn = true
            isBusy = false
            return .success(true)
        }
        catch {
            isBusy = false
            return .failure(.signInError)
        }
    }
    
    func signOut() async -> Result<Bool, UserStateError>  {
        isBusy = true
        do{
            try await Task.sleep(nanoseconds: 1_000_000_000)
            AppData.user = User(useraname: "", isPremium: false)
            AppData.accessToken = ""
            isLoggedIn = false
            isBusy = false
            return .success(true)
        }catch{
            isBusy = false
            return .failure(.signOutError)
        }
    }
}


