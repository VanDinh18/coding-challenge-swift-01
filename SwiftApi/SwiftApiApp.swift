//
//  SwiftApiApp.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 04/05/2023.
//

import SwiftUI

@main
struct SwiftApiApp: App {
    @StateObject private var userInfoController = UserInfoController()
    @StateObject private var authModel = AuthModel()
    
    var body: some Scene {
        WindowGroup {
            ApplicationSwitcher()
                .environment(\.managedObjectContext,
                              userInfoController.container.viewContext)
                .environmentObject(authModel)
        }
    }
}

struct ApplicationSwitcher: View {
    
    @EnvironmentObject var vm: AuthModel
    
    var body: some View {
        if (vm.isLoggedIn) {
            MainTabScreen()
        } else {
            LoginScreen()
        }
        
    }
}
