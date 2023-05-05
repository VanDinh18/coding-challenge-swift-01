//
//  CircleButton.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 04/05/2023.
//

import Foundation
import SwiftUI

struct CircleButton: View {
    // iconName là biến tính giống như props
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: 50, height: 50)
            .background(
                Circle().foregroundColor(Color(.white))
            )
            .shadow(
                color: Color.accent.opacity(0.25),
                radius: 10,
                x: 0,
                y: 0
            )
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(iconName: "info")
    }
}
