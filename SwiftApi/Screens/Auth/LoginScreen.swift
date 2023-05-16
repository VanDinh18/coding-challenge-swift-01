//
//  LoginScreen.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 16/05/2023.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var vm: AuthModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.isBusy {
                    ProgressView()
                }
                else{
                    Text("Login")
                        .font(.title)
                        .bold()
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Enter a password", text: $password)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        Task {
                            await vm.signIn(
                                email: email,
                                password:password
                            )
                        }
                    }) {
                        Text("Sign In")
                    }
                }
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
