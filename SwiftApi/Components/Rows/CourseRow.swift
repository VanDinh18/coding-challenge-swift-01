//
//  CourseRow.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 08/05/2023.
//

import SwiftUI

struct CourseRow: View {
    
    let course: CourseModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: course.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 200)
                .cornerRadius(10)
            Text(course.name)
                .font(.system(size: 18))
                .fontWeight(.medium)
            
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow(
            course: CourseModel(name: "title", image: "https://picsum.photos/id/60/100/300")
        )
    }
}
