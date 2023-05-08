//
//  SideMenuButton.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 05/05/2023.
//

import SwiftUI

struct SideMenuButton: View {
    
    let icon: String
    let title: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SideMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuButton(
            icon: "house",
            title: "title"
        )
    }
}
