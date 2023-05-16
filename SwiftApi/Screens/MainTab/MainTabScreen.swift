//
//  MainTabScreen.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 05/05/2023.
//

import SwiftUI

struct MainTabScreen: View {
    
    @State private var selectedTab: Int = 0
    @State private var isShowMenu: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                SideMenu()
                TabView(selection: $selectedTab){
                    HomeScreen(isShowMenu: $isShowMenu)
                        .tag(0)
                    CartScreen().tag(1)
                    Text("Gift").tag(2)
                    SettingScreen().tag(3)
                }
                .overlay(alignment: .bottom){
                    AppTabBar(selectedTab: $selectedTab)
                        .padding(
                            .bottom,
                            max(UIView.safeAreaBottom, 10)
                        )
                }
                .cornerRadius(isShowMenu ? 20 : 0)
                .rotation3DEffect(
                    .init(degrees: isShowMenu ? -15 : 0),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: .trailing
                )
                .offset(x: isShowMenu ? 200: 0)
                .ignoresSafeArea()
            }
        }
    }
}

struct MainTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainTabScreen()
    }
}
