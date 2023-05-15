//
//  ContentView.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                NavigationLink("Tap Me") {
                    Text("Detail View")
                        .toolbar(.hidden, for: .tabBar)
                }
                .navigationTitle("Primary View")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationStack {
                NavigationLink("Tap Me") {
                    Text(" View")
//                        .toolbar(.hidden, for: .tabBar)
                }
                .navigationTitle("Primary View")
            }
            .tabItem {
                Label("Home", systemImage: "bell")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
