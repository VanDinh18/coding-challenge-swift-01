//
//  SettingScreen.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 16/05/2023.
//

import SwiftUI

struct SettingScreen: View {
    
    @EnvironmentObject var vm: AuthModel
    
    var body: some View {
        NavigationView{
            VStack {
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        Task {
                            await vm.signOut()
                        }
                    } label: {
                        Text("Logout")
                    }
                }
            }
        }
    }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}
