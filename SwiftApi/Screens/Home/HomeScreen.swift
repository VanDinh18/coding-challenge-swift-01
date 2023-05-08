//
//  HomeScreen.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 04/05/2023.
//

import Foundation
import UIKit
import SwiftUI

let phoneData = [
    CourseModel(name: "iPhone 11 Pro Max", image: "https://picsum.photos/200/300?grayscale"),
    CourseModel(name: "iPhone 11 Pro", image: "https://picsum.photos/200/300?grayscale"),
    CourseModel(name: "iPhone 11", image: "https://picsum.photos/200/300?grayscale"),
    CourseModel(name: "iPhone XR", image: "https://picsum.photos/200/300?grayscale"),
    CourseModel(name: "iPhone 8", image: "https://picsum.photos/200/300?grayscale")
]

struct HomeScreen: View {
    @State private var isShow: Bool = false
    @Binding var isShowMenu: Bool
    @StateObject private var courseService = CourseService()
    
    var body: some View {
        VStack {
            HStack {
                CircleButton(iconName: isShow ? "plus" : "info")
                    .background(
                        CircleButtonAnimation(animate: $isShow)
                    )
                    .onTapGesture(count: 1) {
                        withAnimation(.spring()){
//                            isShowMenu.toggle()
                        }
                    }
                Spacer()
                Text(isShow ? "Auto Prices" : "Live Prices")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .animation(.none)
                Spacer()
                CircleButton(iconName: "chevron.right")
                    .rotationEffect(Angle(degrees: isShow ? 180 : 0))
                    .onTapGesture(count: 1) {
                        withAnimation(.spring()){
                            isShow.toggle()
                        }
                    }
                    .background(
                        CircleButtonAnimation(animate: $isShow)
                    )
            }
            .padding(.horizontal, 24)
            
//            VStack() {
                List {
                    ForEach(phoneData, id: \.self) {course in
                        CourseRow(course: course)
                    }
                }
                
//            }
            
            Spacer()
        }
        .onAppear {
            courseService.fetch()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(isShowMenu: .constant(true))
    }
}
