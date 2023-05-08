//
//  SideMenu.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 05/05/2023.
//

import SwiftUI

struct SideMenu: View {
    var body: some View {
        VStack {
            HStack {
                
            }
            VStack {
                SideMenuButton(icon: "house", title: "home")
                SideMenuButton(icon: "house", title: "home")
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(.purple)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
