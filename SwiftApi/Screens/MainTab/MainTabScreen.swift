//
//  MainTabScreen.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 05/05/2023.
//

import SwiftUI

struct MainTabScreen: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeScreen().tag(0)
            Text("Cart").tag(1)
            Text("Gift").tag(2)
            Text("Settings").tag(3)
        }
        .overlay(alignment: .bottom){
            AppTabBar(selectedTab: $selectedTab)
                .padding(
                    .bottom,
                    max(UIView.safeAreaBottom, 10)
                )
        }
        .ignoresSafeArea()
    }
}

struct MainTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainTabScreen()
    }
}
