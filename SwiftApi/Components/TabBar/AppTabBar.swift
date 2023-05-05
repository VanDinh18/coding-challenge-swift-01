//
//  AppTabBar.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 04/05/2023.
//

import SwiftUI

struct AppTabBar: View {
    @State private var selection = 0
    @Binding var selectedTab: Int
    
    let tabBarItems: [(image: String, title: String, tabKey: Int)] = [
        ("ic-home", "Home", 0),
        ("ic-cart", "Cart", 1),
        ("ic-gift", "Gift", 2),
        ("ic-settings", "Setting", 3)
    ]
    
    var body: some View {
        ZStack {
            HStack() {
                ForEach(tabBarItems, id: \.tabKey ) { tab in
                    Button {
                        selectedTab = tab.tabKey
                    } label: {
                        Spacer()
                        VStack(spacing: 0) {
                            Image(tab.image)
                            Text(tab.title)
                                .foregroundColor(
                                    selectedTab == tab.tabKey ? Color.tabItemText : Color.accent
                                )
                                .font(.system(size: 10))
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    
                }
            }
            .frame(width: .infinity, height: 54)
            .background(.thinMaterial)
            .cornerRadius(16)
            .padding(.horizontal)
            .shadow(
                color: Color.accent.opacity(0.15),
                radius: 6,
                x: 0,
                y: 0
            )
        }
        
        
    }
}

struct AppTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBar(selectedTab: .constant(0))
    }
}
