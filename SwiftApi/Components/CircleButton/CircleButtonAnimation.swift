//
//  CircleButtonAnimation.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 04/05/2023.
//

import SwiftUI

struct CircleButtonAnimation: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0: 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(
                Animation.easeOut(duration: 1.0),
                value: animate ? 1 : 0
            )
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimation(animate: .constant(true))
            .foregroundColor(Color(.red))
            .frame(width: 50, height: 50)
    }
}
