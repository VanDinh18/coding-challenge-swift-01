//
//  HomeScreen.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 04/05/2023.
//

import Foundation
import UIKit
import SwiftUI

struct HomeScreen: View {
    @State private var isShow: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                CircleButton(iconName: isShow ? "plus" : "info")
                    .background(
                        CircleButtonAnimation(animate: $isShow)
                    )
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
            Spacer()
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
