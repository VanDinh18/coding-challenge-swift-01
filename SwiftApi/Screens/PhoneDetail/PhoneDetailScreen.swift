//
//  PhoneDetailScreen.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 12/05/2023.
//

import SwiftUI

struct PhoneDetailScreen: View {
    
    let course: CourseModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(course.name)
        
    }
}

struct PhoneDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PhoneDetailScreen(course: CourseModel(name: "IPhone", image: "https://picsum.photos/200/300?grayscale"))
    }
}
